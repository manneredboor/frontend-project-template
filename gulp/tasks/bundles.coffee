gulp        = require 'gulp'
uglify      = require 'gulp-uglify'
concat      = require 'gulp-concat'
paths       = require '../paths.coffee'
errhandler  = require '../errhandler.coffee'

module.exports = ->
  gulp.src paths.bundles.src
    .pipe concat paths.bundles.bundle
    .pipe uglify
      preserveComments: 'some'
    .pipe gulp.dest paths.bundles.dest
    