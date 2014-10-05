gulp = require "gulp"
phantomochajs = require "./lib"

gulp.task "default", ->
  test_scripts = [
    "spec/spec_helper.coffee"
    "spec/**/*_spec.coffee"
    "spec/**/*_spec.js"]
  gulp.src test_scripts
    .pipe phantomochajs()

