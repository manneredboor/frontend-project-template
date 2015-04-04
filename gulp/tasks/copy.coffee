gulp  = require 'gulp'
copy  = require 'gulp-copy'
paths = require '../paths.coffee'

gulp.task 'copy', ->
  gulp.src paths.resources.src
    .pipe copy paths.resources.dest,
      prefix: paths.resources.prefix
      