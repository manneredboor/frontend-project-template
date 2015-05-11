gutil = require 'gulp-util'

module.exports = (error) ->
	header = '\n[' + gutil.colors.red(' ---- ERROR IN ' + error.plugin + ' ---- ') + ']\n';
	gutil.log	header, error.message,
	this.emit 'end'
	gutil.beep()
