'use strict'

angular.module('cowMilkingClickerApp').factory 'Game', ['Log', (Log) -> 
	new class Game
		constructor: ->
			@nbCows = 0
			@milkQty = 0
		
		addMilk: (milkQtyToAdd) ->
			@milkQty += milkQtyToAdd
			Log.addMessage "You milked your cows and gathered #{ milkQtyToAdd }ml of milk."
			
		addCow: (nbCowsToAdd) ->
			@nbCows += nbCowsToAdd
			plural = nbCowsToAdd > 1
			Log.addMessage "You added #{ nbCowsToAdd } cow#{ if plural then 's' else '' } to your heard!"
]