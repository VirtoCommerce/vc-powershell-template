// Call this to register your module to main application
var moduleName = '{JsModuleId}';

if (AppDependencies !== undefined) {
    AppDependencies.push(moduleName);
}

angular.module(moduleName, [])
    .config(['$stateProvider', '$urlRouterProvider',
        function ($stateProvider, $urlRouterProvider) {
            $stateProvider
                .state('workspace.{JsModuleId}State', {
                    url: '/{JsModuleId}',
                    templateUrl: '$(Platform)/Scripts/common/templates/home.tpl.html',
                    controller: [
                        '$scope', 'platformWebApp.bladeNavigationService', function ($scope, bladeNavigationService) {
                            var newBlade = {
                                id: 'blade1',
                                controller: '{JsModuleId}.helloWorldController',
                                template: 'Modules/$({Namespace})/Scripts/blades/hello-world.html',
                                isClosingDisabled: true
                            };
                            bladeNavigationService.showBlade(newBlade);
                        }
                    ]
                });
        }
    ])
    .run(['platformWebApp.mainMenuService', 'platformWebApp.widgetService', '$state',
        function (mainMenuService, widgetService, $state) {
            //Register module in main menu
            var menuItem = {
                path: 'browse/{JsModuleId}',
                icon: 'fa fa-cube',
                title: '{JsModuleId}',
                priority: 100,
                action: function () { $state.go('workspace.{JsModuleId}State'); },
                permission: '{JsModuleId}:access'
            };
            mainMenuService.addMenuItem(menuItem);
        }
    ]);
