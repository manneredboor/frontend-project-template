gulp				= require 'gulp'
plumber			= require 'gulp-plumber'
concat			= require 'gulp-concat'
gulpFilter	= require 'gulp-filter'
flatten			= require 'gulp-flatten'
bowerMain		= require 'main-bower-files'
paths				= require '../paths.coffee'
errhandler	= require '../errhandler.coffee'

jsFilter		= gulpFilter '*.js'
cssFilter		= gulpFilter '*.css'
fontFilter	= gulpFilter ['*.eot', '*.woff', '*.svg', '*.ttf']
imageFilter	= gulpFilter ['*.gif', '*.png', '*.svg', '*.jpg', '*.jpeg']

gulp.task 'bower', ->

	gulp.src bowerMain()

		# JS
		.pipe jsFilter
		.pipe concat paths.bower.bundleNames.js
		.pipe gulp.dest paths.bower.dest.js
		.pipe jsFilter.restore()

		# CSS
		.pipe cssFilter
		.pipe concat paths.bower.bundleNames.css
		.pipe gulp.dest paths.bower.dest.css
		.pipe cssFilter.restore()

		# FONTS
		.pipe fontFilter
		.pipe flatten()
		.pipe gulp.dest paths.bower.dest.fonts
		.pipe fontFilter.restore()

		# IMAGES
		.pipe imageFilter
		.pipe flatten()
		.pipe gulp.dest paths.bower.dest.images
		.pipe imageFilter.restore()
