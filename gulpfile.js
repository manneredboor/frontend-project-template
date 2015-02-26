require('coffee-script/register');

require('./gulp/loadtasks.coffee')([
	// 'browserify',
	'clean',
	'browsersync',
	'scripts',
	'copy',
	'default',
	'iconfont',
	'jade',
	'spritesmith',
	'stylus',
	'watch'
]);
