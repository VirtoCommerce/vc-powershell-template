angular.module('{JsModuleId}')
    .controller('{JsModuleId}.helloWorldController', ['$scope', '{JsModuleId}.webApi', function ($scope, api) {
        var blade = $scope.blade;
        blade.title = '{JsModuleId}';

        blade.refresh = function () {
            api.get(function (data) {
                blade.title = '{JsModuleId}.blades.hello-world.title';
                blade.data = data.result;
                blade.isLoading = false;
            });
        };

        blade.refresh();
    }]);
