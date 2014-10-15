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
			
		eat: ->
			@model.hunger -= (@model.eatingSpeed / 1000 * @tickTime)
			clampHunger
			
		digest: ->
			@model.hunger += (@model.digestingSpeed / 1000 * @tickTime)
			clampHunger
			
		gotoPen: ->	@model.state = 'pen'
		gotoPasture: -> @model.state = 'pasture'
			
		inPen: -> @model.state == 'pen'
		inPasture: -> @model.state == 'pasture'
			
		hungry: -> @model.hunger > 0
		full: -> @model.hunger >= maxHunger
		
		clampHunger: ->
			if @model.hunger <= 0
				@model.hunger = 0
			if @model.hunger >= @model.maxHunger
				@model.hunger = @model.maxHunger
				
		tick: (tickTime) ->
			@tickTime = tickTime
		
			if inPasture then eat
				if not hungry then gotoPen
			
			if inPen then digest()
				if full then gotoPasture
					
				