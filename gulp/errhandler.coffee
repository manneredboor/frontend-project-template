gutil = require 'gulp-util'

module.exports = (error) ->
	header = '\n' + gutil.colors.bgRed(' ---- ERROR IN ' + error.plugin + ' ---- ') + '\n';
	gutil.log	header, error.message
	this.emit 'end' if this.emit
	gutil.beep()
