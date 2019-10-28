SET "SOURCE_DIR=%~dp0%.."
SET "TARGET_DIR=%SOURCE_DIR%\NuGet"

IF NOT DEFINED ProgramFiles(x86) SET ProgramFiles(x86)=%ProgramFiles%
IF NOT DEFINED MSBUILD_PATH IF EXIST "%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe" (
    FOR /f "usebackq tokens=*" %%i IN (`"%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe" -latest -products * -requires Microsoft.Component.MSBuild -property installationPath`) DO (
        IF EXIST "%%i\MSBuild\Current\Bin\MSBuild.exe" (
            SET "MSBUILD_PATH=%%i\MSBuild\Current\Bin\MSBuild.exe"
        )
        IF NOT DEFINED MSBUILD_PATH IF EXIST "%%i\MSBuild\15.0\Bin\MSBuild.exe" (
            SET "MSBUILD_PATH=%%i\MSBuild\15.0\Bin\MSBuild.exe"
        )
    )
)
IF NOT DEFINED MSBUILD_PATH IF EXIST "%ProgramFiles(x86)%\MSBuild\14.0\Bin\MSBuild.exe" SET MSBUILD_PATH=%ProgramFiles(x86)%\MSBuild\14.0\Bin\MSBuild.exe
IF NOT DEFINED MSBUILD_PATH IF EXIST "%ProgramFiles(x86)%\MSBuild\12.0\Bin\MSBuild.exe" SET MSBUILD_PATH=%ProgramFiles(x86)%\MSBuild\12.0\Bin\MSBuild.exe
IF NOT DEFINED MSBUILD_PATH SET MSBUILD_PATH=%WINDIR%\Microsoft.NET\Framework\v4.0.30319\msbuild.exe

nuget.exe restore "%SOURCE_DIR%\{Namespace}.sln"
"%MSBUILD_PATH%" "%SOURCE_DIR%\{Namespace}.sln" /nologo /verbosity:m /t:Build /p:Configuration=Release;Platform="Any CPU"

nuget pack "%SOURCE_DIR%\{Namespace}.Core\{Namespace}.Core.csproj" -IncludeReferencedProjects -Symbols -Properties Configuration=Release -OutputDirectory "%TARGET_DIR%"
nuget pack "%SOURCE_DIR%\{Namespace}.Data\{Namespace}.Data.csproj" -IncludeReferencedProjects -Symbols -Properties Configuration=Release -OutputDirectory "%TARGET_DIR%"
pause
