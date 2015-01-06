gulp = require("gulp")
webpack = require("webpack")
WebpackDevServer = require("webpack-dev-server")
gulpWebpack = require("gulp-webpack")
path = require("path")

gulp.task "build", ->
  gulp.src "src/**/*.{js, coffee}"
    .pipe gulpWebpack
      watch: true
      progress: true
      minify: true
      resolve:
        root: path.join(__dirname, "src/")
        extensions: [
          ""
          ".coffee"
          ".js"
        ]
      module:
        loaders: [
          { test: /\.coffee$/, loader: "coffee-loader" }
        ]
      entry:
        app: "entry.coffee"
      output:
        filename: "[name].js"
    .pipe gulp.dest("dist/")
