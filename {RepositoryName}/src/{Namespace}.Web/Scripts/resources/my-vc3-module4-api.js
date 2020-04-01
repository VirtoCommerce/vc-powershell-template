angular.module('{ModuleId}')
    .factory('{ModuleId}.webApi', ['$resource', function ($resource) {
        return $resource('api/{ModuleId}');
}]);
