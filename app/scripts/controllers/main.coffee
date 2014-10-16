'use strict';

###*
 # @ngdoc function
 # @name cowMilkingClickerApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the cowMilkingClickerApp
###

angular.module('cowMilkingClickerApp').controller 'MainCtrl', ($scope, Game, Log, localStorageService) ->
    
  $scope.awesomeThings = [
    'HTML5 Boilerplate',
    'AngularJS',
    'Karma'
  ]
	   
  $scope.game = Game
  $scope.log = Log

  $scope.save = ->
    localStorageService.set 'game', JSON.stringify(Game)
    Log.addMessage "Game Saved..."

  $scope.load = ->
    Game.load(localStorageService.get('game'));
    Log.addMessage("Game Loaded...");

  tick = ->
    Game.tick 100
    $scope.showWarning = Game.milkQty >= 5
    $scope.$apply()
    
  timer = setInterval tick, 100
