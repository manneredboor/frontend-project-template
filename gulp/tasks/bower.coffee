gulp        = require 'gulp'
bowerMain   = require 'main-bower-files'
concat      = require 'gulp-concat'
gulpFilter  = require 'gulp-filter'
flatten     = require 'gulp-flatten'
paths       = require '../paths.coffee'
errhandler  = require '../errhandler.coffee'

jsFilter    = gulpFilter '*.js'
cssFilter   = gulpFilter '*.css'
fontFilter  = gulpFilter ['*.eot', '*.woff', '*.svg', '*.ttf']
imageFilter = gulpFilter ['*.gif', '*.png', '*.svg', '*.jpg', '*.jpeg']

module.exports = ->
  
  gulp.src bowerMain()
    
    # JS
    .pipe jsFilter
    .pipe concat paths.bower.bundleNames.js
    .pipe gulp.dest paths.bower.destDirs.js
    .pipe jsFilter.restore()
    
    # CSS
    .pipe cssFilter
    .pipe concat paths.bower.bundleNames.css
    .pipe gulp.dest paths.bower.destDirs.css
    .pipe cssFilter.restore()
    
    # FONTS
    .pipe fontFilter
    .pipe flatten()
    .pipe gulp.dest paths.bower.destDirs.fonts
    .pipe fontFilter.restore()
    
    # IMAGES
    .pipe imageFilter
    .pipe flatten()
    .pipe gulp.dest paths.bower.destDirs.images
    .pipe imageFilter.restore()
