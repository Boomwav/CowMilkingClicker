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
    'ngTouch'
  ])
  .config(function ($routeProvider) {
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
  });
