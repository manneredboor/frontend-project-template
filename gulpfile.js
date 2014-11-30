require('coffee-script/register');

require('./gulp/loadtasks.coffee')([
	'browserify',
	'browsersync',
	// 'coffee',
	'copy',
	'default',
	'iconfont',
	'jade',
	'spritesmith',
	'stylus',
	'watch'
]);
