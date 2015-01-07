# Karma configuration
# Generated on Tue Jan 06 2015 17:13:01 GMT+0900 (JST)

glob = require("glob")

module.exports = (config) ->

  config.set

    basePath: "../"

    # available frameworks: https://npmjs.org/browse/keyword/karma-adapter
    frameworks: ["mocha", "chai"]

    # available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
    preprocessors:
      "spec/**/*.coffee": ["webpack"]

    webpack: require("./webpack_config")

    # available reporters: https://npmjs.org/browse/keyword/karma-reporter
    reporters: ["spec"]

    # web server port
    port: 9876

    # enable / disable colors in the output (reporters and logs)
    colors: true

    logLevel: config.LOG_DEBUG

    autoWatch: false

    # available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
    browsers: [
      "PhantomJS"
      "Firefox"
    ]

    singleRun: true

