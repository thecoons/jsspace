# Pull our gulp package
gulp = require 'gulp'
gutil = require 'gulp-util'
coffee = require 'gulp-coffee'
#Create default task
gulp.task 'default', ->
  gutil.log 'Gulp is running !!!'

gulp.task 'coffee', ->
  gulp.src './public/source/javascript/**/*.coffee'
    .pipe (coffee {bare:true}
      .on 'error', gutil.log)
    .pipe gulp.dest './public/assets/javascript/'

gulp.watch './public/source/javascript/**/*.coffee', ['coffee']
