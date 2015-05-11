gulp	= require 'gulp'
copy	= require 'gulp-copy'
newer	= require 'gulp-newer'
paths	= require '../paths.coffee'

gulp.task 'copy', ->
	gulp.src paths.resources.src
		.pipe newer paths.resources.dest
		.pipe copy paths.resources.dest,
			prefix: paths.resources.prefix
