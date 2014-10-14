'use strict';

/**
 * @ngdoc overview
 * @name cowMilkingClickerApp
 * @description
 * # cowMilkingClickerApp
 *
 * Main module of the application.
 */

var app = angular
	.module('cowMilkingClickerApp', [
	'ngAnimate',
	'ngRoute',
	'ngTouch',
	'mgcrea.ngStrap',
	'LocalStorageModule'
	])
	.config(function ($routeProvider, localStorageServiceProvider) {
		$routeProvider
			.when('/', {
				templateUrl: 'views/main.html',
				controller: 'MainCtrl'
			})
			.when('/about', {
				templateUrl: 'views/about.html',
				controller: 'AboutCtrl'
			})
			.otherwise({
				redirectTo: '/'
			});
		  
		localStorageServiceProvider.setPrefix('cowMilkingClickerApp');		
	});
