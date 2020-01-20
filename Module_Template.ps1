param 
(
    [string]$ModuleName = "CustomerReviews",
    [string]$Author = "Jon Doe",
    [string]$CompanyName = "VirtoCommerce",
    [string]$PlatformVersion = "2.13.56",
    [string]$CoreModuleVersion = "2.25.32"
)
$constants = @{}

$constants.ModuleName = $ModuleName # Module name
$constants.Author = $Author # Your name
$constants.CompanyName = $CompanyName # Company name
$constants.PlatformVersion = $PlatformVersion
$constants.CoreModuleVersion = $CoreModuleVersion 

function ConvertTo-KebabCase($str) 
{
    if([string]::IsNullOrWhitespace($str) -or ($str -match " ")) 
    {
        throw "Cannot convert '$str' to kebab case, invalid string"
    } else 
    {
        [string]$result = ($str -creplace "([a-z])([A-Z])","`$1_`$2" -creplace "-","_" -split "_" | % { $_.ToLower() }) -join "-"
        return $result 
    }
}

$constants.KebabModuleName = ConvertTo-KebabCase $constants.ModuleName
$constants.ModuleId = "$($constants.ModuleName)Module"
$constants.Namespace = "$($constants.CompanyName).$($constants.ModuleId)"
$constants.ModuleTitle = "$($constants.CompanyName) $($constants.ModuleName) extension module"
$constants.CoreProjectDescription = "$($constants.CompanyName) $($constants.ModuleName) extension models and interfaces"
$constants.DataProjectDescription = "$($constants.CompanyName) $($constants.ModuleName) extension persistence layer and services"
$constants.TestProjectDescription = "$($constants.CompanyName) $($constants.ModuleName) unit tests"
$constants.RepositoryName = "vc-module-$($constants.KebabModuleName)"
$constants.RepositoryUrl = "https://github.com/VirtoCommerce/$($constants.RepositoryName)"

$constants.Copyright = "Copyright © $($constants.CompanyName) 2018-2019"
$constants.Owner = $constants.CompanyName
$constants.NuGetServerUrl = "nuget.org"
$constants.JenkinsName = 'virtoModule'

$constants.CoreProjectGuid = (New-Guid).ToString("B").ToUpperInvariant()
$constants.DataProjectGuid = (New-Guid).ToString("B").ToUpperInvariant()
$constants.TestsProjectGuid = (New-Guid).ToString("B").ToUpperInvariant()
$constants.WebProjectGuid = (New-Guid).ToString("B").ToUpperInvariant()
$constants.SolutionGuid = (New-Guid).ToString("B").ToUpperInvariant()

 function Replace-Constants ($oldValue, $constants)
{
    $result = $oldValue
    $constants.keys.ForEach({$result = $result -replace "{$_}", $constants[$_]})
    return $result
}

$scriptDir = (Split-Path $script:MyInvocation.MyCommand.Path)

foreach($item in Get-ChildItem -Path $scriptDir -Recurse -Exclude *.ps1)
{
    if (-not $item.PSIsContainer)
    {
        # Update file content

        $content = Get-Content $item
        $newContent = Replace-Constants $content $constants
        [System.IO.File]::WriteAllLines($item, $newContent) # Save without BOM

        # Rename file
        $newPath = Replace-Constants $item $constants
        if ($newPath -ne $item.FullName)
        {
            Write-Host $newPath

            $newDir = Split-Path $newPath
            if (-not (Test-Path $newDir))
            {
                $d = New-Item -ItemType Directory -Path $newDir
            }

            Move-Item -Path $item -Destination $newPath

            $oldDir = Split-Path $item.FullName
            if ((Get-ChildItem $oldDir).Length -eq 0)
            {
                Remove-Item $oldDir
            }
        }
    }
}
