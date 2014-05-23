'use strict';

/* App Module */

var empApp = angular.module('pns-App', [ 'ngRoute', 'ProjControllers',
		'genServices', 'ui.bootstrap', 'ngUpload']);

empApp.config([ '$routeProvider', function($routeProvider) {
	$routeProvider.

	when('/home', {
		templateUrl : './form_home.html',
		controller : 'allProjectController'
	}).

	when('/newproject', {
		templateUrl : './form_newProject.html',
		/*controller : 'NewProjectController'*/
		controller : 'myCtrl'
	}).

	when('/allprojects', {
		templateUrl : './form_allProjects.html',
		controller : 'allProjectController'
	}).
	
	when('/openprojectcontent/:id', {
		templateUrl : './form_openProjectContent.html',
		controller : 'openProjectController'
	}).
	
	when('/newclass', {
		templateUrl : './form_newClass.html',
		controller : 'NewClassController'
	}).

	when('/newprojupload', {
		templateUrl : './form_projectUpload.html',
		controller : 'UploadCtrl'
	}).
	
	when('/newpackage', {
		templateUrl : './form_newPackage.html',
		controller : 'NewPackageCtrl'
	}).
	
			
	when('/openclassdetails/:id', {
		templateUrl : './form_classes.html',
		controller : 'openPackageController'
	}).
	
	when('/openmethoddetails/:id', {
		templateUrl : './form_methods.html',
		controller : 'openMethodController'
	}).
	
	when('/openmethoddetailss/:id', {
		templateUrl : './form_methodDetails.html',
		controller : 'openMethodDetailController'
	}).
	
	when('/fileuploadsuccess', {
		templateUrl : './fileuploadsuccess.html',
		/*controller : 'openMethodDetailController'*/
	}).
	
	when('/fileuploadunsuccess', {
		templateUrl : './fileuploadunsuccess.html',
		/*controller : 'openMethodDetailController'*/
	}).
	
	when('/networkdiagram', {
		templateUrl : './form_networkDiagram.html',
		controller : 'networkDiagramController'
	}).
	
	otherwise({
		redirectTo : '/home'
	});
	
} ]);
