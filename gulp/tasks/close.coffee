gulp  = require 'gulp'
del   = require 'del'
gutil = require 'gulp-util'
paths = require '../paths.coffee'

gulp.task 'close', ->

	gutil.log gutil.colors.magenta '# Done.'

	process.exit()
