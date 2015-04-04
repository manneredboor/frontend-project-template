gulp        = require 'gulp'
gulpif      = require 'gulp-if'
coffee      = require 'gulp-coffee'
concat      = require 'gulp-concat'
paths       = require '../paths.coffee'
errhandler  = require '../errhandler.coffee'

gulp.task 'scripts', ->
  gulp.src paths.scripts.src
    .pipe gulpif(/[.]coffee$/, coffee()).on('error', errhandler)
    .pipe concat paths.scripts.bundle
    .pipe gulp.dest paths.scripts.dest
    