gulp		= require 'gulp'
coffee		= require 'gulp-coffee'
uglify		= require 'gulp-uglify'
paths		= require '../paths.coffee'
errhandler	= require '../errhandler.coffee'

module.exports = ->
	gulp.src paths.coffee.src
		.pipe coffee()
			.on 'error', errhandler
		.pipe do uglify
		.pipe gulp.dest paths.coffee.dest
		