runSequence = require 'run-sequence'

module.exports = ->

  runSequence 'clean',
  [
    'copy'
    'bower'
    'iconfont'
    'spritesmith'
  ], [
    'jade'
    'stylus'
    'scripts'
    'browserify'
  ], [
    'bundles'
  ], [
    'browsersync'
    'watch'
  ]
