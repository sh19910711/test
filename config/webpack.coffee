path = require("path")
webpack = require("webpack")
packageInfo = require("../package.json")

module.exports =
  resolve:
    root: [
      path.join(__dirname, "..", "bower_components")
      path.join(__dirname, "..", "src")
    ]

    extensions: [
      ""
      ".coffee"
      ".js"
    ]

  module:
    loaders: [
      { test: /\.coffee$/, loader: "coffee-loader" }
    ]
  
  plugins: [
    new webpack.ResolverPlugin [
      new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin "bower.json", ["main"]
    ]
    new webpack.DefinePlugin
      ENABLE_FLAG: true
  ]
