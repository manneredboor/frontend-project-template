require('coffee-script/register');

require('./gulp/loadtasks.coffee')([
  'bower',
  'browserify',
  'browsersync',
  'bundles',
  'clean',
  'copy',
  'default',
  'iconfont',
  'jade',
  'scripts',
  'spritesmith',
  'stylus',
  'watch'
]);
