'use strict'

angular.module('cowMilkingClickerApp').factory 'Game', ['Log', 'Cow', (Log, Cow) -> 
	new class Game
		constructor: ->
			@model =
				nbCows: 0
				cows: []
				milkQty: 0
				money: 0
		
		addMilk: (milkQtyToAdd, useLog = true) ->
			@model.milkQty += milkQtyToAdd
			
			if useLog
				Log.addMessage "You milked your cows and gathered #{ milkQtyToAdd }ml of milk."
			
		addCow: (nbCowsToAdd) ->
			@model.nbCows += nbCowsToAdd
			
			@model.cows.push new Cow() for cow in [nbCowsToAdd..1]
			
			plural = nbCowsToAdd > 1
			Log.addMessage "You added #{ nbCowsToAdd } cow#{ if plural then 's' else '' } to your heard!"
			
		tick: (tickTime) ->
			@addMilk (0.01 / 1000 * tickTime),false
			
			if @model.nbCows > 0 
				cow.tick tickTime for cow in @model.cows
]