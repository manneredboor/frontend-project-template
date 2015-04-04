gulp         = require 'gulp'
stylus       = require 'gulp-stylus'
csscomb      = require 'gulp-csscomb'
cmq          = require 'gulp-combine-media-queries'
cssmin       = require 'gulp-cssmin'
autoprefixer = require 'gulp-autoprefixer'
paths        = require '../paths.coffee'
pkg          = require '../../package.json'
errhandler   = require '../errhandler.coffee'

gulp.task 'stylus', ->
  gulp.src paths.stylus.src
    .pipe stylus()
      .on 'error', errhandler
    .pipe csscomb()
      .on 'error', errhandler
    .pipe cmq()
      .on 'error', errhandler
    .pipe autoprefixer [
      'Android >= '  + pkg.browsers.android,
      'Chrome >= '   + pkg.browsers.chrome,
      'Firefox >= '  + pkg.browsers.firefox,
      'Explorer >= ' + pkg.browsers.ie,
      'iOS >= '      + pkg.browsers.ios,
      'Opera >= '    + pkg.browsers.opera,
      'Safari >= '   + pkg.browsers.safari
    ]
    .pipe do cssmin
    .pipe gulp.dest paths.stylus.dest
    