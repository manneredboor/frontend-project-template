gulp        = require 'gulp'
watchify    = require 'watchify'
browserify  = require 'browserify'
uglify      = require 'gulp-uglify'
streamify   = require 'gulp-streamify'
source      = require 'vinyl-source-stream'
paths       = require '../paths.coffee'
errhandler  = require '../errhandler.coffee'

bundler = browserify({
    entries: [ paths.browserify.src ],
    extensions: ['.coffee']
  })
  .transform 'coffeeify'
  .bundle()
    .on 'error', errhandler
  .pipe source paths.browserify.bundle
  .pipe streamify do uglify
  .pipe gulp.dest paths.browserify.dest

rebundler = watchify bundler
rebundler.on 'update', rebundle

rebundle = ->
  bundler.bundle()
    .pipe source paths.browserify.bundle
    .pipe gulp.dest paths.browserify.dest

module.exports = ->
  bundler()
  