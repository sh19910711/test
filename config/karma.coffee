# Karma configuration
# Generated on Tue Jan 06 2015 17:13:01 GMT+0900 (JST)

path = require("path")

module.exports = (config) ->
  config.set

    # base path that will be used to resolve all patterns (eg. files, exclude)
    basePath: '..'


    # frameworks to use
    # available frameworks: https://npmjs.org/browse/keyword/karma-adapter
    frameworks: ['mocha', 'chai', 'mocha-debug']


    # list of files / patterns to load in the browser
    files: [
      'spec/**/*_spec.coffee'
    ]

    # list of files to exclude
    exclude: [
    ]

    # preprocess matching files before serving them to the browser
    # available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
    preprocessors: {
      'spec/**/*.coffee': ['webpack']
    }

    webpack:
      resolve:
        root: path.join(__dirname, "../src")
        extensxions: [
          ""
          ".coffee"
          ".js"
        ]

      entry:
        app: "entry.coffee"

      module:
        loaders: [
          { test: /\.coffee$/, loader: "coffee-loader" }
        ]

    # test results reporter to use
    # possible values: 'dots', 'progress'
    # available reporters: https://npmjs.org/browse/keyword/karma-reporter
    reporters: ['progress']


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
    logLevel: config.LOG_DEBUG


    # enable / disable watching file and executing tests whenever any file changes
    autoWatch: false


    # start these browsers
    # available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
    browsers: ['PhantomJS']


    # Continuous Integration mode
    # if true, Karma captures browsers, runs the tests and exits
    singleRun: true

    client:
      mocha:
        reporter: "html"
        ui: "bdd"
