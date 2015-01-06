gulp = require("gulp")
webpack = require("webpack")
WebpackDevServer = require("webpack-dev-server")
gulpWebpack = require("gulp-webpack")
path = require("path")
karma = require("karma")

gulp.task "test", (done)->
  karmaConfig = {
    configFile: path.join(__dirname, "config/karma.coffee")
  }
  karma.server.start karmaConfig, ->
    done()
  undefined

gulp.task "build", ->
  webpackConfig = require("./config/webpack")
  gulp.src "src/**/*.coffee"
    .pipe gulpWebpack(webpackConfig)
    .pipe gulp.dest("dist/")
