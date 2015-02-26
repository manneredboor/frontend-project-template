module.exports =
  dev: 'dev'
  dist: 'dist'

  clean: [
    './dist'
  ]

  browserify:
    src: './dev/coffee/main.coffee'
    dest: 'dist/js'
    bundle: 'main.js'
    watch: [ 'dev/coffee/**/*.coffee', 'dev/coffee/**/*.js' ]

  scripts:
    src: [
      'dev/scripts/libs/jquery.min.js',
      'dev/scripts/libs/**/*.js',
      'dev/scripts/**/*.js',
      'dev/scripts/**/*.coffee'
    ]
    dest: 'dist/js'
    bundle: 'main.js'
    watch: ['dev/scripts/**/*.coffee', 'dev/scripts/**/*.js']

  resources:
    src: 'dev/resources/**/*'
    dest: 'dist'
    prefix: 2

  iconfont:
    src: 'dev/iconfont/**/*.svg'
    fontName: 'iconfont'
    targetPath: '../../../dev/stylus/helpers/iconfont.styl'
    fontPath: '../fonts/iconfont/'
    dest: 'dist/fonts/iconfont'
    template: 'gulp/templates/iconfont.styl'

  jade:
    src: 'dev/jade/pages/**/*.jade'
    watch: 'dev/jade/**/*.jade'
    dest: 'dist'

  spritesmith:
    src: 'dev/sprite/**/*.png'
    imgName: 'sprite.png'
    imgPath: '../images/sprite.png'
    cssName: 'sprite.styl'
    imgDest: 'dist/images'
    cssDest: 'dev/stylus/helpers'

  stylus:
    src: ['dev/stylus/**/*.styl', '!dev/stylus/{base,blocks,helpers,partials}/**/*']
    dest: 'dist/css'
    watch: 'dev/stylus/**/*.styl'
    
  sync: [
    'dist/**/*'
  ]
