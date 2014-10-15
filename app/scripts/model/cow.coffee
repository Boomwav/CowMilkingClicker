'use strict';

angular.module('cowMilkingClickerApp').factory 'Cow', -> 
	class Cow
		constructor: ->
			@model =
				name: 'Unamed cow'
				age: 6

				stamina: 0
				maxStamina: 100
				tiringSpeed: 1
				restingSpeed: 1

				hunger: 0
				maxHunger: 100
				digestingSpeed: 1
				eatingSpeed: 1

				milkInside: 100
				maxMilkInside: 100
				milkExpulsionSpeed: 1
				milkRegenSpeed: 1
				totalMilkProduced: 0
				
				state: 'pasture'
				
		tick: (tickTime) ->
			if @model.state == 'pasture'
				@model.hunger -= (@model.eatingSpeed / 1000 * tickTime)
				
				if @model.hunger <= 0
					@model.hunger = 0
					@model.state = 'pen'
					
			if @model.state == 'pen'
				@model.hunger += (@model.digestingSpeed / 1000 * tickTime)
				
				if @model.hunger >= @model.maxHunger
					@model.hunger = @model.maxHunger
					@model.state = 'pasture'
					
				