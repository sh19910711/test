gulp = require "gulp"
phantomochajs = require "./lib"

gulp.task "default", ->
  gulp.src "spec/**/*_spec.js.coffee"
    .pipe phantomochajs({})

