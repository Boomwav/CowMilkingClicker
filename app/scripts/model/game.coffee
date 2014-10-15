'use strict'

angular.module('cowMilkingClickerApp').factory 'Game', ['Log', 'Cow', (Log, Cow) -> 
	new class Game
		constructor: ->
			@nbCows = 0
			@cows = []
			@milkQty = 0
			@money = 0
		
		addMilk: (milkQtyToAdd, useLog = true) ->
			@milkQty += milkQtyToAdd
			
			if useLog
				Log.addMessage "You milked your cows and gathered #{ milkQtyToAdd }ml of milk."
			
		addCow: (nbCowsToAdd) ->
			@nbCows += nbCowsToAdd
			
			@cows.push new Cow() for cow in [nbCowsToAdd..1]
			
			plural = nbCowsToAdd > 1
			Log.addMessage "You added #{ nbCowsToAdd } cow#{ if plural then 's' else '' } to your heard!"
			
		tick: (tickTime) ->
			@addMilk (0.01 / 1000 * tickTime),false
			
			if @nbCows > 0 
				cow.tick tickTime for cow in @cows
				
		load: (data) ->
			_.extend this, data
			
			@cows = 
				for cowData in @cows
					_.extend new Cow, cowData
				
]