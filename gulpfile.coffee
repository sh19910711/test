gulp = require "gulp"
phantomochajs = require "./lib"

gulp.task "default", ->
  gulp.src ["spec/spec_helper.coffee", "spec/**/*_spec.coffee"]
    .pipe phantomochajs(
    )

