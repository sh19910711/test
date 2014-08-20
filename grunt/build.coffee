module.exports = (grunt)->
  _ = require "lodash"
  config = grunt.config()

  # $ grunt bower:build
  _(config).merge
    bower:
      build:
        options:
          targetDir: "dist/js/lib"
          verbose: true

  grunt.initConfig config

  # $ grunt build
  grunt.registerTask(
    "build"
    [
      "bower:build"
    ]
  )

