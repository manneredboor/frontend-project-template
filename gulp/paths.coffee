module.exports =
	dev: 'dev'
	dist: 'dist'

	clean: [
		'./dist',
		'./temp'
	]

	browserify:
		src: './dev/scripts/main.coffee'
		watch: [
			'!dev/scripts/plugins'
			'!dev/scripts/libs'
			'dev/scripts/**/*.coffee'
			'dev/scripts/**/*.js'
		]
		bundle: 'browserify-bundle.js'
		paths: [
			'./dev/scripts/'
		]
		dest: 'temp'

	bower:
		bundleNames: {
			js: 'bower-bundle.js'
			css: 'bower-bundle.css'
		}
		watch: 'bower.json'
		dest: {
			js: './temp/'
			css: './temp/'
			fonts: './temp/bower/fonts'
			images: './temp/bower/images'
		}

	scripts:
		src: [
			'dev/scripts/libs/**/*.js'
			'dev/scripts/libs/**/*.coffee'
			'dev/scripts/plugins/*.js'
			'dev/scripts/plugins/*.coffee'
		]
		watch: [
			'dev/scripts/libs/**/*.js'
			'dev/scripts/libs/**/*.coffee'
			'dev/scripts/plugins/*.js'
			'dev/scripts/plugins/*.coffee'
		]
		bundle: 'mybundle.js'
		dest: 'temp/'

	bundles:
		src: [
			'temp/bower-bundle.js'
			'temp/mybundle.js'
			'temp/browserify-bundle.js'
		]
		watch: [
			'temp/bower-bundle.js'
			'temp/mybundle.js'
			'temp/browserify-bundle.js'
		]
		bundle: 'main.js'
		dest: 'dist/js'

	resources:
		src: [
			'dev/resources/**/*'
			'dev/resources/**/.*'
		]
		watch: [
			'dev/resources/**/*'
			'dev/resources/**/.*'
		]
		prefix: 2
		dest: 'dist'

	jade:
		src: 'dev/jade/pages/**/*.jade'
		watch: 'dev/jade/**/*.jade'
		dest: 'dist'

	iconfont:
		src: 'dev/iconfont/**/*.svg'
		watch: 'dev/iconfont/**/*.svg'
		fontName: 'iconfont'
		fontPath: '../fonts/iconfont/'
		template: 'gulp/templates/iconfont.styl'
		targetPath: '../../../temp/stylus/iconfont.styl'
		dest: 'dist/fonts/iconfont'

	spritesmith:
		src: 'dev/sprite/**/*.png'
		watch: 'dev/sprite/**/*.png'
		cssName: 'sprite.styl'
		cssDest: 'temp/stylus/'
		imgName: 'sprite.png'
		imgDest: 'dist/images'
		imgPath: '../images/sprite.png'
		template: 'gulp/templates/sprite.template.handlebars'

	stylus:
		src: [
			'dev/stylus/**/*.styl'
			'!dev/stylus/{base,blocks,helpers,partials}/**/*'
		]
		watch: [
			'temp/stylus/**/*.styl'
			'dev/stylus/**/*.styl'
		]
		dest: 'dist/css'

	sync:
		rewrite: true
		baseDir: './dist'
		watch: [
			'dist/**/*'
		]
