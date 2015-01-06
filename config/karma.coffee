# Karma configuration
# Generated on Tue Jan 06 2015 17:13:01 GMT+0900 (JST)

webpack = require("webpack")
path = require("path")
glob = require("glob")

module.exports = (config) ->

  config.set

    # base path that will be used to resolve all patterns (eg. files, exclude)
    basePath: "../"


    # frameworks to use
    # available frameworks: https://npmjs.org/browse/keyword/karma-adapter
    frameworks: ["webpack", "mocha", "chai"]

    plugins: [
      require "karma-mocha"
      require "karma-chai"
      require "karma-coffee-preprocessor"
      require "karma-phantomjs-launcher"
      require "karma-firefox-launcher"
      require "karma-spec-reporter"
      require "karma-webpack"
    ]


    # list of files / patterns to load in the browser
    files: glob.sync("spec/**/*_spec.coffee")

    # preprocess matching files before serving them to the browser
    # available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
    preprocessors:
      "spec/**/*.coffee": ["webpack"]

    webpack:
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
        new webpack.ProvidePlugin
          "jquery": "bower_components/jquery"
      ]

    webpackServer:
      noINfo: true

    # test results reporter to use
    # possible values: "dots", "progress"
    # available reporters: https://npmjs.org/browse/keyword/karma-reporter
    reporters: ["spec"]


    # web server port
    port: 9876

    # enable / disable colors in the output (reporters and logs)
    colors: true


    # level of logging
    # possible values:
    # - config.LOG_DISABLE
    # - config.LOG_ERROR
    # - config.LOG_WARN
    # - config.LOG_INFO
    # - config.LOG_DEBUG
    logLevel: config.LOG_INFO


    # enable / disable watching file and executing tests whenever any file changes
    autoWatch: false


    # start these browsers
    # available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
    browsers: [
      "PhantomJS"
      # "Firefox"
    ]

    # Continuous Integration mode
    # if true, Karma captures browsers, runs the tests and exits
    singleRun: true

