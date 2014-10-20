gulp = require "gulp"
amdOptimizer = require "gulp-amd-optimizer"

gulp.task "build/with/relative", ->
  gulp.src ["./src_with_relative/test.js"]
    .pipe amdOptimizer(
      baseUrl: "src_with_relative"
    )

gulp.task "build/without/relative", ->
  gulp.src ["./src_without_relative/test.js"]
    .pipe amdOptimizer(
      baseUrl: "src_without_relative"
    )

gulp.task "default", [
  "build/with/relative"
  "build/without/relative"
]
