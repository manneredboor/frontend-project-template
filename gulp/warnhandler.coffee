gutil = require 'gulp-util'

module.exports = (error) ->
	header = '\n' + gutil.colors.bgYellow(' ---- WARNING IN ' + error.plugin + ' ---- ') + '\n';
	gutil.log	header, error.message
