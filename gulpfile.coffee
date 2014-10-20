gulp = require "gulp"
amdOptimizer = require "gulp-amd-optimizer"

gulp.task "build/with/relative", ->
  gulp.src ["./src_with_relative/test.js"]
    .pipe amdOptimizer(
      baseUrl: "src"
    )

gulp.task "build/without/relative", ->
  gulp.src ["./src_without_relative/test.js"]
    .pipe amdOptimizer(
      baseUrl: "src"
    )

gulp.task "default", [
  "build/with/relative"
  "build/without/relative"
]
