gulp = require("gulp")

gulp.task "bower", (done)->
  bower = require("bower")
  bower.commands.install().on "end", ->
    done()
  undefined

gulp.task "test", ["bower"], (done)->
  karma = require("gulp-karma")
  path = require("path")
  gulp.src ["spec/**/*_spec.coffee"]
    .pipe karma
      configFile: path.join(__dirname, "config/karma.coffee")

gulp.task "build", ->
  gulpWebpack = require("gulp-webpack")
  webpackConfig = require("./config/webpack")
  gulp.src "src/**/*.coffee"
    .pipe gulpWebpack(webpackConfig)
    .pipe gulp.dest("dist/")
