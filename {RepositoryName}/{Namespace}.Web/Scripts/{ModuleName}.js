var moduleName = '{ModuleId}';

if (AppDependencies !== undefined) {
    AppDependencies.push(moduleName);
}

angular.module(moduleName, [])
.run(['platformWebApp.widgetService', 'platformWebApp.bladeNavigationService', 'platformWebApp.toolbarService',
        function (widgetService, bladeNavigationService, toolbarService) {

        }
    ]);
