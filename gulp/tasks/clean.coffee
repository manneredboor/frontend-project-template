gulp  = require 'gulp'
del   = require 'del'
gutil = require 'gulp-util'
paths = require '../paths.coffee'

gulp.task 'clean', ->
	del.sync paths.clean

	paths.clean.forEach (dir) ->

		gutil.log gutil.colors.cyan	dir + ' was cleaned'
