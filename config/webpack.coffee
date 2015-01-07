path = require("path")
webpack = require("webpack")

module.exports =

  resolve:
    root: [
      path.join(__dirname, "..", "bower_components")
      path.join(__dirname, "..", "bower_components/test-webpack/src")
    ]

    extensions: [
      ""
      ".coffee"
      ".js"
    ]

  entry: [
    "test-webpack"
  ]

  output:
    filename: "assets.js"

  module:
    loaders: [
      { test: /\.coffee$/, loader: "coffee-loader" }
    ]
  
  plugins: [
    new webpack.ResolverPlugin [
      new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin "bower.json", ["main"]
    ]

    new webpack.DefinePlugin
      VERSION: JSON.stringify("1.2.3")
      ENABLE_FLAG: true

    new webpack.optimize.UglifyJsPlugin
      compress:
        warnings: false
  ]
