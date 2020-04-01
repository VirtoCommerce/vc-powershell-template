angular.module('{ModuleId}')
    .controller('{ModuleId}.helloWorldController', ['$scope', '{ModuleId}.webApi', function ($scope, api) {
        var blade = $scope.blade;
        blade.title = '{ModuleId}';

        blade.refresh = function () {
            api.get(function (data) {
                blade.title = '{ModuleId}.blades.hello-world.title';
                blade.data = data.result;
                blade.isLoading = false;
            });
        };

        blade.refresh();
    }]);
