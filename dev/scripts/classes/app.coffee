config = require 'config'

module.exports = class App

	debug: (msg) ->

		console.log msg if config.debug

	constructor: ->

		@debug 'App Initialize'
