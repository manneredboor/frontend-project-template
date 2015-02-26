gulp      = require 'gulp'
watchify  = require 'watchify'
paths     = require '../paths.coffee'

module.exports = ->
  # gulp.watch paths.browserify.watch, ['browserify']
  gulp.watch paths.scripts.watch, ['scripts']
  gulp.watch paths.resources.src, ['copy']
  gulp.watch paths.iconfont.src, ['iconfont']
  gulp.watch paths.jade.watch, ['jade']
  gulp.watch paths.spritesmith.src, ['spritesmith']
  gulp.watch paths.stylus.watch, ['stylus']
  