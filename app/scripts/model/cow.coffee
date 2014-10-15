'use strict';

angular.module('cowMilkingClickerApp').factory 'Cow', -> 
	class Cow
		constructor: ->
			@name = 'Unamed cow'
			@age = 6
            
			@stamina = 0
			@maxStamina = 100
			@tiringSpeed = 1
			@restingSpeed = 1
            
			@hunger = 0
			@maxHunger = 100
			@digestingSpeed = 1
			@eatingSpeed = 1
            
			@milkInside = 100
			@maxMilkInside = 100
			@milkExpulsionSpeed = 1
			@milkRegenSpeed = 1
			@totalMilkProduced = 0
			
			@state = 'pasture'
			
		eat: ->
			@hunger -= (@eatingSpeed / 1000 * @tickTime)
			@clampHunger()
			
		digest: ->
			@hunger += (@digestingSpeed / 1000 * @tickTime)
			@clampHunger()
			
		gotoPen: ->	@state = 'pen'
		gotoPasture: -> @state = 'pasture'
			
		inPen: -> @state == 'pen'
		inPasture: -> @state == 'pasture'
			
		hungry: -> @hunger > 0
		full: -> @hunger >= @maxHunger
		
		clampHunger: ->
			if @hunger <= 0
				@hunger = 0
			if @hunger >= @maxHunger
				@hunger = @maxHunger
				
		tick: (tickTime) ->
			@tickTime = tickTime
		
			if @inPasture()
				@eat()
				if not @hungry() then @gotoPen()
			
			if @inPen()
				@digest()
				if @full() then @gotoPasture()
					
				