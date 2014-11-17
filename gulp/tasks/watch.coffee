gulp = require 'gulp'
paths = require '../paths.coffee'

module.exports = ->
	gulp.watch paths.coffee.src, ['coffee']
	gulp.watch paths.resources.src, ['copy']
	gulp.watch paths.iconfont.src, ['iconfont']
	gulp.watch paths.jade.src, ['jade']
	gulp.watch paths.spritesmith.src, ['spritesmith']
	gulp.watch paths.stylus.watch, ['stylus']
	