module.exports = (grunt)->
  _ = require "lodash"
  config = grunt.config()

  # $ grunt bower:build
  _(config).merge
    bower:
      build:
        options:
          targetDir: "public/js/lib"
          verbose: true

  _(config).merge
    coffee:
      build:
        files: [
          {
            expand: true
            cwd: "vendor/assets/coffee/"
            src: "**/*.coffee"
            dest: "public/js/app/"
            ext: ".js"
          }
        ]

  grunt.initConfig config

  # $ grunt build
  grunt.registerTask(
    "build"
    [
      "bower:build"
      "coffee:build"
    ]
  )

