gulp				= require 'gulp'
plumber			= require 'gulp-plumber'
iconfont		= require 'gulp-iconfont'
iconfontCss	= require 'gulp-iconfont-css'
paths				= require '../paths.coffee'
errhandler	= require '../errhandler.coffee'

gulp.task 'iconfont', ->
	gulp.src paths.iconfont.src
		.pipe plumber errorHandler: errhandler
		.pipe iconfontCss
			path: paths.iconfont.template
			fontName: paths.iconfont.fontName
			targetPath: paths.iconfont.targetPath
			fontPath: paths.iconfont.fontPath
		.pipe iconfont
			fontName: paths.iconfont.fontName
			normalize: true
			fontHeight: 1001
		.pipe gulp.dest paths.iconfont.dest
