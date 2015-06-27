gulp         = require 'gulp'
jeet         = require 'jeet'
gulpif       = require 'gulp-if'
gutil        = require 'gulp-util'
stylus       = require 'gulp-stylus'
plumber      = require 'gulp-plumber'
csso         = require 'gulp-csso'
autoprefixer = require 'gulp-autoprefixer'
cmq          = require 'gulp-combine-media-queries'
paths        = require '../paths.coffee'
pkg          = require '../../package.json'
errhandler   = require '../errhandler.coffee'

gulp.task 'stylus', ->
	gulp.src paths.stylus.src
		.pipe plumber errorHandler: errhandler
		.pipe stylus
			use: jeet()
			compress: true
			sourcemap: unless gutil.env.p then {comment: false, inline: true} else false
			"include css": true
		.pipe autoprefixer
			browsers: [
				'Android >= '	+ pkg.browsers.android,
				'Chrome >= '	 + pkg.browsers.chrome,
				'Firefox >= '	+ pkg.browsers.firefox,
				'Explorer >= ' + pkg.browsers.ie,
				'iOS >= '			+ pkg.browsers.ios,
				'Opera >= '		+ pkg.browsers.opera,
				'Safari >= '	 + pkg.browsers.safari
			],
			cascade: false
		.pipe gulpif gutil.env.p, cmq()
		.pipe gulpif gutil.env.p, csso()
		.pipe gulp.dest paths.stylus.dest
