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
	
	//$scope.showWarning = Game.milkQty >= 5;
		
	$scope.save = function() {
		localStorageService.set('game', JSON.stringify(Game));
		Log.addMessage("Game Saved...");
	}
	
	$scope.load = function() {
		Game.load(localStorageService.get('game'));
		Log.addMessage("Game Loaded...");
	}
	
	var timer = setInterval(function(){
		Game.tick(100);
		
		$scope.showWarning = Game.milkQty >= 5;
		
		$scope.$apply()
	}, 100);
	
  });
