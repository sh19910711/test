path = require("path")
webpack = require("webpack")
packageInfo = require("../package.json")

module.exports =

  progress: true

  resolve:
    root: path.join(__dirname, "..", "src")
    extensions: [
      ""
      ".coffee"
    ]

  module:
    loaders: [
      { test: /\.coffee$/, loader: "coffee-loader" }
    ]

  entry:
    app: "entry.coffee"

  output:
    filename: "[name].js"

  plugins: [
    new webpack.DefinePlugin
      VERSION: JSON.stringify(packageInfo["version"])
  ]

  client:
    mocha:
      reporter: "html"
