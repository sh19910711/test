gulp = require("gulp")
webpack = require("webpack")
WebpackDevServer = require("webpack-dev-server")
gulpWebpack = require("gulp-webpack")
path = require("path")
karma = require("karma")
bower = require("bower")

gulp.task "bower", (done)->
  bower.commands.install().on "end", ->
    done()
  undefined

gulp.task "test", ["bower"], (done)->
  karmaConfig = {
    configFile: path.join(__dirname, "config/karma.coffee")
  }
  karma.server.start karmaConfig, (err)->
    throw new Error "karma: test failed" if err
    done()
  undefined

gulp.task "build", ->
  webpackConfig = require("./config/webpack")
  gulp.src "src/**/*.coffee"
    .pipe gulpWebpack(webpackConfig)
    .pipe gulp.dest("dist/")
