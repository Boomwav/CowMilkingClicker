'use strict';

/**
 * @ngdoc function
 * @name cowMilkingClickerApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the cowMilkingClickerApp
 */
angular.module('cowMilkingClickerApp')
  .controller('MainCtrl', function ($scope, Game, Log, localStorageService) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
	   
	$scope.game = Game;
	$scope.log = Log;
		
	$scope.save = function() {
		Log.addMessage("Game Saved...");
		localStorageService.set('game', JSON.stringify(Game.model));
	}
	
	$scope.load = function() {
		Log.addMessage("Game Loaded...");
		Game.model = localStorageService.get('game');
	}
	
	var timer = setInterval(function() {Game.tick(100); $scope.$apply()}, 100);
	
  });
