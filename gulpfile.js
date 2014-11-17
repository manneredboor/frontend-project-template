require('coffee-script/register');

require('./gulp/loadtasks.coffee')([
	'browsersync',
	'coffee',
	'copy',
	'default',
	'iconfont',
	'jade',
	'spritesmith',
	'stylus',
	'watch'
]);
