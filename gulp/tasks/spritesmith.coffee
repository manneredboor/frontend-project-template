gulp        = require 'gulp'
plumber     = require 'gulp-plumber'
spritesmith = require 'gulp.spritesmith'
paths       = require '../paths.coffee'
errhandler  = require '../errhandler.coffee'

gulp.task 'spritesmith', ->
  spriteData = gulp.src paths.spritesmith.src
    .pipe plumber errorHandler: errhandler
    .pipe spritesmith
      cssTemplate: paths.spritesmith.template
      imgName: paths.spritesmith.imgName
      imgPath: paths.spritesmith.imgPath
      cssName: paths.spritesmith.cssName
      algorithm: 'binary-tree'
  spriteData.img.pipe gulp.dest paths.spritesmith.imgDest
  spriteData.css.pipe gulp.dest paths.spritesmith.cssDest
