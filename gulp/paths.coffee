module.exports =
	dev: 'dev'
	dist: 'dist'

	browserify:
		src: './dev/coffee/main.coffee'
		bundle: 'main.js'
		dest: 'dist/js'
		watch: [ 'dev/coffee/**/*.coffee', 'dev/coffee/**/*.js' ]

	coffee:
		src: 'dev/coffee/**/*.coffee'
		dest: 'dist/js'

	resources:
		src: 'dev/resources/**/*'
		dest: 'dist'
		prefix: 2

	iconfont:
		src: 'dev/iconfont/**/*.svg'
		fontName: 'iconfont'
		targetPath: '../../../stylus/helpers/iconfont.styl'
		fontPath: '../fonts/sprite/'
		dest: 'dev/resources/fonts/sprite'
		template: 'gulp/templates/iconfont.styl'

	jade:
		src: 'dev/jade/pages/**/*.jade'
		watch: 'dev/jade/**/*.jade'
		dest: 'dist'

	spritesmith:
		src: 'dev/sprite-png/**/*.png'
		imgName: 'sprite.png'
		imgPath: '../images/sprite.png'
		cssName: 'sprite-png.styl'
		imgDest: 'dev/resources/images'
		cssDest: 'dev/stylus/helpers'

	stylus:
		src: ['dev/stylus/**/*.styl', '!dev/stylus/{base,blocks,helpers,partials}/**/*']
		dest: 'dist/css'
		watch: 'dev/stylus/**/*.styl'
		
	sync: [
		'dist/**/*'
	]
