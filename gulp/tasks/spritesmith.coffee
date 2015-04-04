gulp        = require 'gulp'
spritesmith = require 'gulp.spritesmith'
paths       = require '../paths.coffee'

gulp.task 'spritesmith', ->
  spriteData = gulp.src paths.spritesmith.src
    .pipe spritesmith
      cssTemplate: paths.spritesmith.template
      imgName: paths.spritesmith.imgName
      imgPath: paths.spritesmith.imgPath
      cssName: paths.spritesmith.cssName
      algorithm: 'binary-tree'
  spriteData.img.pipe gulp.dest paths.spritesmith.imgDest
  spriteData.css.pipe gulp.dest paths.spritesmith.cssDest
