'use strict';

/* Services */

var genServices = angular.module('genServices', [ 'ngResource' ]);

genServices.factory('Record', [ '$resource', '$http',
		function($resource, $http, $scope) {

			var o = $resource('../projects', {}, {
				query : {
					method : 'GET',
					params : {},
					isArray : true
				}
			});

			return (o);

		} ]);

genServices.factory('Record', [ '$resource', '$http',
		function($resource, $http, $scope) {

			var o = $resource('../projects', {}, {
				query : {
					method : 'GET',
					params : {},
					isArray : true
				}
			});

			return (o);

		} ]);

/*
 * genServices.factory('Recordopen', [ '$resource', '$http', '$routeParams',
 * function($resource, $http, $routeParams) {
 * 
 * var o = $resource('../projects/:id', {}, { show : { method : 'GET', params : {
 * 'id' : $routeParams.id }, isArray : false } });
 * 
 * return (o); } ]);
 */
