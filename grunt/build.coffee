module.exports = (grunt)->
  _ = require "lodash"
  config = grunt.config()

  # $ grunt bower:build
  _(config).merge
    bower:
      build:
        options:
          targetDir: "lib/app/public/js/lib"
          install: true
          verbose: true
          cleanTargetDir: true
          cleanBowerDir: true

  # $ grunt coffee:build
  _(config).merge
    coffee:
      build:
        files: [
          {
            expand: true
            cwd: "vendor/assets/coffee/"
            src: "**/*.coffee"
            dest: "lib/app/public/js/app/"
            ext: ".js"
          }
        ]

  # $ grunt sass:build
  _(config).merge
    sass:
      build:
        files: [
          {
            expand: true
            cwd: "vendor/assets/sass/"
            src: "**/*.sass"
            dest: "lib/app/public/css/app/"
            ext: ".css"
          }
        ]

  # $ grunt cssmin:build
  _(config).merge
    cssmin:
      build:
        files:
          "lib/app/public/css/app/main.css": [
            "vendor/assets/css/**/*.css"
          ]

  grunt.initConfig config

  # $ grunt build
  grunt.registerTask(
    "build"
    [
      "bower:build"
      "coffee:build"
      "cssmin:build"
    ]
  )
