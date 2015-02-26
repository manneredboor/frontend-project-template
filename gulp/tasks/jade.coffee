gulp        = require 'gulp'
jade        = require 'gulp-jade'
prettify    = require 'gulp-prettify'
paths       = require '../paths.coffee'
errhandler  = require '../errhandler.coffee'

module.exports = ->
  gulp.src paths.jade.src
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
    