gulp  = require 'gulp'
gutil = require 'gulp-util'

module.exports = (tasks) ->

  gutil.log gutil.colors.magenta('# Loading: ')

  tasks.forEach (name) ->

    task = require('./tasks/' + name + '.coffee')

    if typeof task is 'function'
      gulp.task name, task

    else if typeof task is 'object'

      if task.preTask? and task.task?
        gulp.task name, task.pretasks, task.task
      else if task.task?
        gulp.task name, task.task
      else
        gulp.task name, task

    gutil.log gutil.colors.magenta('+') + ' ' + gutil.colors.green(name) 
    return

  gutil.log gutil.colors.magenta('# Load end ')

  gulp
