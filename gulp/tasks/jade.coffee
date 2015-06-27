gulp       = require 'gulp'
jade       = require 'gulp-jade'
newer      = require 'gulp-newer'
prettify   = require 'gulp-prettify'
paths      = require '../paths.coffee'
errhandler = require '../errhandler.coffee'

gulp.task 'jade', ->
	gulp.src paths.jade.src
		.pipe newer paths.jade.dest
		.pipe jade()
			.on 'error', errhandler
		.pipe prettify
			brace_style: 'expand'
			indent_size: 1
			indent_char: '\t'
			indent_with_tabs: true
			condense: true
			indent_inner_html: true
			preserve_newlines: true
		.pipe gulp.dest paths.jade.dest
