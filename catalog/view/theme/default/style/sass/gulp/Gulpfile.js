var gulp = require('gulp'),
  	sass = require('gulp-ruby-sass'),
  	livereload = require('gulp-livereload'),
  	watch = require('gulp-watch');

gulp.task('sass', function() {
	return gulp.src('../*.sass')
	.pipe(sass())
	.pipe(gulp.dest('../../'));
});

gulp.task('watch', function() {
  livereload.listen();
  gulp.watch('../meta/*.sass', ['sass']);
  gulp.watch('../blocks/*.sass', ['sass']);
  gulp.watch('../../*.css').on('change', livereload.changed);
});

gulp.task('default', ['sass', 'watch']);
