gulp        = require 'gulp'
isThere     = require 'is-there'
plumber     = require 'gulp-plumber'
concat      = require 'gulp-concat'
gulpFilter  = require 'gulp-filter'
flatten     = require 'gulp-flatten'
bowerMain   = require 'main-bower-files'
paths       = require '../paths.coffee'
warnhandler = require '../warnhandler.coffee'

jsFilter    = gulpFilter '*.js', { restore: true }
cssFilter   = gulpFilter '*.css', { restore: true }
fontFilter  = gulpFilter ['*.eot', '*.woff', '*.svg', '*.ttf'], { restore: true }
imageFilter = gulpFilter ['*.gif', '*.png', '*.svg', '*.jpg', '*.jpeg'], { restore: true }

gulp.task 'bower', ->

	unless isThere paths.bower.json
		warnhandler
			plugin: 'bower'
			message: 'bower.json did not exist'
		return

	unless isThere paths.bower.dir
		warnhandler
			plugin: 'bower'
			message: 'bower_components did not exist'
		return

	gulp.src bowerMain
			paths:
				bowerDirectory: paths.bower.dir,
				bowerrc: paths.bower.rc,
				bowerJson: paths.bower.json

		# JS
		.pipe jsFilter
		.pipe concat paths.bower.bundleNames.js
		.pipe gulp.dest paths.bower.dest.js
		.pipe jsFilter.restore

		# CSS
		.pipe cssFilter
		.pipe concat paths.bower.bundleNames.css
		.pipe gulp.dest paths.bower.dest.css
		.pipe cssFilter.restore

		# FONTS
		.pipe fontFilter
		.pipe flatten()
		.pipe gulp.dest paths.bower.dest.fonts
		.pipe fontFilter.restore

		# IMAGES
		.pipe imageFilter
		.pipe flatten()
		.pipe gulp.dest paths.bower.dest.images
		.pipe imageFilter.restore
