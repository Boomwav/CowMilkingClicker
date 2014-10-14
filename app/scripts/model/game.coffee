'use strict'

angular.module('cowMilkingClickerApp').factory 'Game', ['Log', (Log) -> 
	new class Game
		constructor: ->
			@model =
				nbCows: 0
				milkQty: 0
				money: 0
		
		addMilk: (milkQtyToAdd, useLog = true) ->
			@model.milkQty += milkQtyToAdd
			
			if useLog
				Log.addMessage "You milked your cows and gathered #{ milkQtyToAdd }ml of milk."
			
		addCow: (nbCowsToAdd) ->
			@model.nbCows += nbCowsToAdd
			plural = nbCowsToAdd > 1
			Log.addMessage "You added #{ nbCowsToAdd } cow#{ if plural then 's' else '' } to your heard!"
			
		tick: (tickTime) ->
			@addMilk (0.01 / 1000 * tickTime),false
]