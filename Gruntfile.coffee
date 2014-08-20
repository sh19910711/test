module.exports = (grunt)->
  grunt.loadTasks "grunt"

  pkg = grunt.file.readJSON "package.json"
  for task of pkg.dependencies when /^grunt-/.test task
    grunt.loadNpmTasks task
