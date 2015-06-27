gulp       = require 'gulp'
gulpif     = require 'gulp-if'
coffee     = require 'gulp-coffee'
concat     = require 'gulp-concat'
plumber    = require 'gulp-plumber'
paths      = require '../paths.coffee'
errhandler = require '../errhandler.coffee'

gulp.task 'scripts', ->
	gulp.src paths.scripts.src
		.pipe plumber errorHandler: errhandler
		.pipe gulpif /[.]coffee$/, coffee()
		.pipe concat paths.scripts.bundle
		.pipe gulp.dest paths.scripts.dest
