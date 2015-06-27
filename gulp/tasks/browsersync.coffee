gulp        = require 'gulp'
browserSync = require 'browser-sync'
paths       = require '../paths.coffee'
modRewrite  = require 'connect-modrewrite'

params =
	baseDir: paths.sync.baseDir

if paths.sync.rewrite
	params.middleware = [
		modRewrite [
			'!\\.\\w+ /index.html [L]'
		]
	]

gulp.task 'browsersync', ->
	browserSync.init paths.sync.watch,
		server:
			params
		logFileChanges: false
		open: true
		notify: true
