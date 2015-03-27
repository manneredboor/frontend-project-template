module.exports =
  dev: 'dev'
  dist: 'dist'

  clean: [
    './dist',
    './temp'
  ]

  browserify:
    src: './dev/scripts/main.coffee'
    dest: 'temp'
    bundle: 'browserify-bundle.js'
    paths: [
      './dev/scripts/'
    ]
    watch: [
      '!dev/scripts/plugins'
      '!dev/scripts/libs'
      'dev/scripts/**/*.coffee'
      'dev/scripts/**/*.js'
    ]

  bower:
    bundleNames: {
      js: 'bower-bundle.js'
      css: 'bower-bundle.css'
    }
    destDirs: {
      js: './temp/'
      css: './temp/'
      fonts: './temp/bower/fonts'
      images: './temp/bower/images'
    }
    watch: 'bower.json'

  scripts:
    src: [
      'dev/scripts/libs/**/*.js'
      'dev/scripts/libs/**/*.coffee'
      'dev/scripts/plugins/*.js'
      'dev/scripts/plugins/*.coffee'
    ]
    dest: 'temp/'
    bundle: 'mybundle.js'
    watch: [
      'dev/scripts/libs/**/*.js'
      'dev/scripts/libs/**/*.coffee'
      'dev/scripts/plugins/*.js'
      'dev/scripts/plugins/*.coffee'
    ]

  bundles:
    src: [
      'temp/bower-bundle.js'
      'temp/mybundle.js'
      'temp/browserify-bundle.js'
    ]
    dest: 'dist/js'
    bundle: 'main.js'
    watch: [
      'temp/bower-bundle.js'
      'temp/mybundle.js'
      'temp/browserify-bundle.js'
    ]

  resources:
    src: 'dev/resources/**/*'
    dest: 'dist'
    prefix: 2

  jade:
    src: 'dev/jade/pages/**/*.jade'
    watch: 'dev/jade/**/*.jade'
    dest: 'dist'

  iconfont:
    src: 'dev/iconfont/**/*.svg'
    fontName: 'iconfont'
    fontPath: '../fonts/iconfont/'
    template: 'gulp/templates/iconfont.styl'
    targetPath: '../../../temp/stylus/iconfont.styl'
    dest: 'dist/fonts/iconfont'

  spritesmith:
    src: 'dev/sprite/**/*.png'
    cssName: 'sprite.styl'
    cssDest: 'temp/stylus/'
    imgName: 'sprite.png'
    imgDest: 'dist/images'
    imgPath: '../images/sprite.png'
    template: 'gulp/templates/sprite.template.handlebars'

  stylus:
    src: [
      'dev/stylus/**/*.styl',
      '!dev/stylus/{base,blocks,helpers,partials}/**/*'
    ]
    dest: 'dist/css'
    watch: [
      'temp/stylus/**/*.styl'
      'dev/stylus/**/*.styl'
    ]
    
  sync:
    rewrite: true
    baseDir: './dist'
    watch: [
      'dist/**/*'
    ]
