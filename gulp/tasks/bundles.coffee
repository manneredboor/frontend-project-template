gulp        = require 'gulp'
gulpif      = require 'gulp-if'
gutil       = require 'gulp-util'
uglify      = require 'gulp-uglify'
concat      = require 'gulp-concat'
plumber     = require 'gulp-plumber'
paths       = require '../paths.coffee'
errhandler  = require '../errhandler.coffee'

gulp.task 'bundles', ->
  gulp.src paths.bundles.src
    .pipe plumber errorHandler: errhandler
    .pipe concat paths.bundles.bundle
    .pipe gulpif gutil.env.p, uglify
      preserveComments: 'some'
    .pipe gulp.dest paths.bundles.dest
    