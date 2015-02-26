gulp        = require 'gulp'
browserSync = require 'browser-sync'
paths       = require '../paths.coffee'

module.exports = ->
  browserSync.init paths.sync,
    server:
      baseDir: './dist'
    logFileChanges: false
    open: true
    notify: false
    minify: false
