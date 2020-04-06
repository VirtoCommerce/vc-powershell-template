angular.module('{JsModuleId}')
    .factory('{JsModuleId}.webApi', ['$resource', function ($resource) {
        return $resource('api/{JsModuleId}');
}]);
