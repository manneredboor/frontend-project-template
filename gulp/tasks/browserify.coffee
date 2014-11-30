gulp		= require 'gulp'
browserify	= require 'browserify'
uglify		= require 'gulp-uglify'
streamify	= require 'gulp-streamify'
source		= require 'vinyl-source-stream'
paths		= require '../paths.coffee'
errhandler	= require '../errhandler.coffee'

module.exports = ->
	browserify({
			entries: [ paths.browserify.src ],
			extensions: ['.coffee']
		})
		.transform 'coffeeify'
		.bundle()
			.on 'error', errhandler
		.pipe source paths.browserify.bundle
		.pipe streamify do uglify
		.pipe gulp.dest paths.browserify.dest
