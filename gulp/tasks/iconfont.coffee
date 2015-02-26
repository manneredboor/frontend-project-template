gulp        = require 'gulp'
iconfont    = require 'gulp-iconfont'
iconfontCss = require 'gulp-iconfont-css'
paths       = require '../paths.coffee'

module.exports = ->
  gulp.src paths.iconfont.src
    .pipe iconfontCss
      path: paths.iconfont.template
      fontName: paths.iconfont.fontName
      targetPath: paths.iconfont.targetPath
      fontPath: paths.iconfont.fontPath
    .pipe iconfont
      fontName: paths.iconfont.fontName
      normalize: true
    .pipe gulp.dest paths.iconfont.dest
    