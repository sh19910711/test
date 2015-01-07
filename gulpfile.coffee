gulp = require("gulp")
bower = require("bower")

gulp.task "bower", (done)->
  bower.commands.install().on "end", ->
    done()
  undefined

gulp.task "build", ["bower"], ->
  gulpWebpack = require("gulp-webpack")
  webpackConfig = require("./config/webpack")
  gulp.src "src/**/*.coffee"
    .pipe gulpWebpack(webpackConfig)
    .pipe gulp.dest("dist/")
