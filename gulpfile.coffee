gulp			= require 'gulp'
clean			= require 'gulp-clean'
copy			= require 'gulp-copy'
jade			= require 'gulp-jade'
prettify		= require 'gulp-prettify'
stylus			= require 'gulp-stylus'
csscomb			= require 'gulp-csscomb'
cmq				= require 'gulp-combine-media-queries'
cssmin			= require 'gulp-cssmin'
autoprefixer	= require 'gulp-autoprefixer'
coffee			= require 'gulp-coffee'
uglify			= require 'gulp-uglify'
spritesmith		= require 'gulp.spritesmith'
iconfont		= require 'gulp-iconfont'
iconfontCss		= require 'gulp-iconfont-css'
webserver		= require 'gulp-webserver'
pkg				= require './package.json'

errorHandler = (error) ->
	console.log '\n# ----- Error in ' + error.plugin + ' ----- #\n'
	console.log error.message
	console.log '\n# ------------------------------- #\n'
	this.emit 'end'

gulp.task 'cleanDist', ->
	gulp.src 'dist'
		.pipe do clean

gulp.task 'jade', ->
	gulp.src 'dev/templates/pages/**/*.jade'
		.pipe jade()
			.on 'error', errorHandler
		.pipe prettify
			brace_style: 'expand'
			indent_size: 1
			indent_char: '\t'
			indent_with_tabs: true
			condense: true
			indent_inner_html: true
			preserve_newlines: true
		.pipe gulp.dest 'dist'

gulp.task 'stylus', ->
	gulp.src ['dev/stylus/**/*.styl', '!dev/stylus/{base,blocks,helpers,partials}/**/*']
		.pipe stylus()
			.on 'error', errorHandler
		.pipe do csscomb
		.pipe do cmq
		.pipe autoprefixer [
			'Android >= '	+ pkg.browsers.android,
			'Chrome >= '	+ pkg.browsers.chrome,
			'Firefox >= '	+ pkg.browsers.firefox,
			'Explorer >= '	+ pkg.browsers.ie,
			'iOS >= '		+ pkg.browsers.ios,
			'Opera >= '		+ pkg.browsers.opera,
			'Safari >= '	+ pkg.browsers.safari
		]
		.pipe do cssmin
		.pipe gulp.dest 'dist/css'

gulp.task 'coffee', ->
	gulp.src 'dev/coffee/**/*.coffee'
		.pipe coffee()
			.on 'error', errorHandler
		.pipe do uglify
		.pipe gulp.dest 'dist/js'

gulp.task 'spritesmith', ->
	spriteData = gulp.src 'dev/sprite-png/**/*.png'
		.pipe spritesmith
			imgName: 'sprite.png'
			cssName: 'sprite-png.styl'
			algorithm: 'binary-tree'
	spriteData.img.pipe gulp.dest 'dev/resources/images'
	spriteData.css.pipe gulp.dest 'dev/stylus/helpers'

gulp.task 'iconfont', ->
	gulp.src 'dev/sprite-svg/**/*.svg'
		.pipe iconfontCss
			fontName: 'sprite-svg',
			targetPath: '../../../stylus/helpers/sprite-svg.styl',
			fontPath: '../fonts/sprite/'
		.pipe iconfont
			fontName: 'sprite-svg'
			normalize: true
		.pipe gulp.dest 'dev/resources/fonts/sprite'

gulp.task 'copy', ->
	gulp.src 'dev/resources/**/*'
		.pipe copy 'dist', 
			prefix: 2

gulp.task 'webserver', ->
	gulp.src 'dist'
		.pipe webserver
			livereload: true
			fallback: 'index.html'

gulp.task 'watch', ->
	gulp.watch 'dev/templates/**/*.jade', ['jade']
	gulp.watch 'dev/stylus/**/*.styl', ['stylus']
	gulp.watch 'dev/coffee/**/*.coffee', ['coffee']
	gulp.watch 'dev/sprite-png/**/*.png', ['spritesmith']
	gulp.watch 'dev/sprite-svg/**/*.svg', ['iconfont']
	gulp.watch 'dev/resources/**/*', ['copy']

gulp.task 'default', ['jade', 'stylus', 'coffee', 'spritesmith', 'iconfont', 'copy', 'webserver', 'watch']
