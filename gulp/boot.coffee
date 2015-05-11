_					 = require 'lodash'
gulp				= require 'gulp'
gutil			 = require 'gulp-util'
tasks			 = require './tasks.json'
runSequence = require 'run-sequence'

loader = (tasks) ->

	_.each tasks, (task) ->

		if typeof task is 'object'
			loader task

		else
			require './tasks/' + task
			gutil.log gutil.colors.magenta('+') + ' ' + gutil.colors.green(task)

module.exports = ->

	if gutil.env._.length > 0
		task = gutil.env._[0]
	else
		task = 'default'

	if _.has tasks, task

		gutil.log gutil.colors.magenta '# Loading Tasks:'
		loader tasks[task]
		gutil.log gutil.colors.magenta '# Loading End.'

		gulp.task task, ->

			runSequence.apply this, tasks[task]

	else
		gutil.log gutil.colors.magenta '# Loading Single Task:'
		require './tasks/' + task
		gutil.log gutil.colors.magenta('+') + ' ' + gutil.colors.green(task)
		gutil.log gutil.colors.magenta '# Loading End.'
