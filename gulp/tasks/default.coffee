runSequence = require 'run-sequence'

module.exports = ->

  runSequence 'clean',
  [
    'spritesmith'
    'iconfont'
    'copy'
  ], [
    # 'browserify'
    # 'watchify'
    'jade'
    'stylus'
    'scripts'
  ], [
    'browsersync'
    'watch'
  ]
