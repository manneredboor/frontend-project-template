gulp	= require 'gulp'
paths	= require '../paths.coffee'

gulp.task 'watch', ->
	gulp.watch paths.bower.watch,				['bower']
	gulp.watch paths.scripts.watch,			['scripts']
	gulp.watch paths.bundles.watch,			['bundles']
	gulp.watch paths.resources.watch,		['copy']
	gulp.watch paths.iconfont.watch,		['iconfont']
	gulp.watch paths.jade.watch,				['jade']
	gulp.watch paths.spritesmith.watch,	['spritesmith']
	gulp.watch paths.stylus.watch,			['stylus']
