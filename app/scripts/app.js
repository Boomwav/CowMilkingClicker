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
    'mgcrea.ngStrap.popover',
	'LocalStorageModule'
	])
	.config(function ($routeProvider, localStorageServiceProvider, $popoverProvider) {
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

        angular.extend($popoverProvider.defaults, {
            animation: 'am-flip-x',
            trigger: 'hover'
        });


	});
