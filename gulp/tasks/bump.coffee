gulp	= require 'gulp'
bump	= require 'gulp-bump'
gutil	= require 'gulp-util'

gulp.task 'bump', ->

	params = {}

	if gutil.env.major
		params =
			type: 'major'

	else if gutil.env.minor
		params =
			type: 'minor'

	else if gutil.env.reset
		params =
			version: '0.1.0'

	gulp.src 'package.json'
		.pipe bump params
		.pipe gulp.dest './'
