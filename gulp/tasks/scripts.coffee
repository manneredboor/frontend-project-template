gulp		= require 'gulp'
gulpif		= require 'gulp-if'
coffee		= require 'gulp-coffee'
uglify		= require 'gulp-uglify'
concat		= require 'gulp-concat'
paths		= require '../paths.coffee'
errhandler	= require '../errhandler.coffee'

module.exports = ->
	gulp.src paths.scripts.src
		.pipe gulpif(/[.]coffee$/, coffee()).on('error', errhandler)
		.pipe concat paths.scripts.bundle
		.pipe uglify
			preserveComments: 'some'
		.pipe gulp.dest paths.scripts.dest
		