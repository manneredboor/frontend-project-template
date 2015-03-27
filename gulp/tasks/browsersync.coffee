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

module.exports = ->
  browserSync.init paths.sync.watch,
    server:
      params
    logFileChanges: false
    open: true
    notify: true
