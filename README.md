# VC module template

## Overview

This script is a lite version of [Virto Commerce 3.x Module Templates](https://marketplace.visualstudio.com/items?itemName=Virto-Commerce.VirtoCommerceModuleTemplates)
It generates a new Visual Studio solution for a module in Virto Commerce Platform. The script automatically creates all the necessary projects:

* Core - Business and Application Models
* Data - Data Access and Implementation of business logic
* Tests - xUnit Unit tests
* Web - API Controllers

and names the folders in accordance with the rules used by the VirtoCommerce development team.

Difference between this script and [Virto Commerce 3.x Module Templates](https://marketplace.visualstudio.com/items?itemName=Virto-Commerce.VirtoCommerceModuleTemplates):

* script does not contain template projects for module extensions:
  * Cart and Order Module extension
  * Pricing Module extension
  * Customer Module extension

## How to use template

1. Download this repository as a ZIP file
2. Unpack ZIP file to a new empty directory
3. Open Windows PowerShell CMD
4. Navigate to script directory in Windows PowerShell CMD
5. Run command:

```command
.\Module_Template.ps1 -ModuleName CustomerReviews -Author "Jon Doe" -CompanyName VirtoCommerce -PlatformVersion "3.0.0" -PlatformNuGetPackageVersion "3.0.0-rc4-0225"
```

where `-ModuleName` your module name, `-Author` your name and `-CompanyName` your company name. This command will replace constants with their values in all files.

6. `PlatformVersion` and `PlatformNuGetPackageVersion` parameters have "3.0.0" "3.0.0-rc4-0225" default values respectively. You can skip these parameters if you use default versions

## License

Copyright (c) Virto Solutions LTD.  All rights reserved.

Licensed under the Virto Commerce Open Software License (the "License"); you
may not use this file except in compliance with the License. You may
obtain a copy of the License at

<http://virtocommerce.com/opensourcelicense>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
implied.
