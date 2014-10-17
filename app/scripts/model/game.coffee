'use strict'

angular.module('cowMilkingClickerApp').factory 'Game', ['Log', 'Cow', (Log, Cow) -> 
  new class Game
    constructor: ->
      @nbCows = 0
      @cows = []
      @milkQty = 0
      @money = 1
    
    addMilk: (milkQtyToAdd, useLog = true) ->
      if @nbCows > 0
        @currentCowInd ?= 0
      
      currentCow = @cows[@currentCowInd]
      
      productivity = 1 * (currentCow.milkInside/currentCow.maxMilkInside)
      milkExpulsed = (currentCow.milkExpulsionSpeed * productivity)
      
      @milkQty += milkExpulsed
      currentCow.milkInside -= milkExpulsed
      
      if useLog
        Log.addMessage """You milked <b>#{currentCow.name}</b> and gathered #{milkExpulsed.toFixed 2}mL of milk."""
      
    addCow: (nbCowsToAdd) ->
      @nbCows += nbCowsToAdd
      
      @cows.push new Cow() for cow in [nbCowsToAdd..1]
      
      plural = nbCowsToAdd > 1
      Log.addMessage "You added #{ nbCowsToAdd } cow#{ if plural then 's' else '' } to your heard!"
      
    tick: (tickTime) ->
      #@addMilk (0.01 / 1000 * tickTime),false
      
      if @nbCows > 0 
        @cowTick tickTime, cow for cow in @cows
    
    cowTick: (tickTime, cow) ->
      if cow.inPasture()
        cow.hunger -= (cow.eatingSpeed / 1000 * tickTime)
        cow.clampHunger()
        if not cow.hungry() then cow.gotoPen()
      if cow.inPen()
        cow.hunger += (cow.digestingSpeed / 1000 * tickTime)
        cow.clampHunger()
        if cow.full() then cow.gotoPasture()
        
      cow.milkInside += (cow.milkRegenSpeed / 1000 * tickTime)
      
      cow
    
    load: (data) ->
      _.extend this, data
      
      @cows = 
        for cowData in @cows
          _.extend new Cow, cowData
        
]