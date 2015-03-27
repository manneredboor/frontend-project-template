gulp        = require 'gulp'
watchify    = require 'watchify'
gutil       = require 'gulp-util'
browserify  = require 'browserify'
streamify   = require 'gulp-streamify'
source      = require 'vinyl-source-stream'
paths       = require '../paths.coffee'
errhandler  = require '../errhandler.coffee'

b = browserify
    entries: [ paths.browserify.src ]
    transform: [ 'caching-coffeeify' ]
    extensions: [ '.coffee' ]
    paths: paths.browserify.paths
    cache: {}
    packageCache: {}
    fullPaths: true

w = watchify b

produceBundle = ->
  gutil.log gutil.colors.cyan  'Producing bundle ' + paths.browserify.src
  w
  .bundle()
    .on 'error', errhandler
  .pipe source paths.browserify.bundle
  .pipe gulp.dest paths.browserify.dest

w.on 'update', produceBundle

module.exports = ->
  produceBundle()
