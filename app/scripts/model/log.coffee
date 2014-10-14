'use strict'

angular.module('cowMilkingClickerApp').factory 'Log', -> 
	new class Log
		constructor: ->
			@messages = []
			
			#@messages = [
			#	{timestamp: "2014-10-14 08:18:18", text: "Message de test"},
			#	{timestamp: "2014-10-14 08:20:00", text: "Deuxieme message de test"}
			#]
					
		addMessage: (text) ->
			now = new Date
			@messages.push {timestamp: now, text: text}