'use strict';

/**
 * @ngdoc function
 * @name cowMilkingClickerApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the cowMilkingClickerApp
 */
angular.module('cowMilkingClickerApp')
  .controller('MainCtrl', function ($scope, Game, Log) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
	
	$scope.game = Game;
	$scope.log = Log;
	
  });
