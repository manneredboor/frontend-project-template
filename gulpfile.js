require('coffee-script/register');

require('./gulp/loadtasks.coffee')([
	// 'browserify',
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
