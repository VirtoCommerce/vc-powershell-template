// Call this to register your module to main application
var moduleName = '{ModuleId}';

if (AppDependencies !== undefined) {
    AppDependencies.push(moduleName);
}

angular.module(moduleName, [])
    .config(['$stateProvider', '$urlRouterProvider',
        function ($stateProvider, $urlRouterProvider) {
            $stateProvider
                .state('workspace.{ModuleId}State', {
                    url: '/{ModuleId}',
                    templateUrl: '$(Platform)/Scripts/common/templates/home.tpl.html',
                    controller: [
                        '$scope', 'platformWebApp.bladeNavigationService', function ($scope, bladeNavigationService) {
                            var newBlade = {
                                id: 'blade1',
                                controller: '{ModuleId}.helloWorldController',
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
                path: 'browse/{ModuleId}',
                icon: 'fa fa-cube',
                title: '{ModuleId}',
                priority: 100,
                action: function () { $state.go('workspace.{ModuleId}State'); },
                permission: '{ModuleId}:read'
            };
            mainMenuService.addMenuItem(menuItem);
        }
    ]);
