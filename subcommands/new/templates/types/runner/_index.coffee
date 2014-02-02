module.exports = <%= _.classify(plugin.subcommand) %>Builder = (grunt) ->
  path = require 'path'
  inside = (newDir, callback) ->
    prevDir = process.cwd()
    grunt.file.setBase newDir
    callback -> grunt.file.setBase(prevDir)

  # Task configuration
  grunt.initConfig
    greeting: 'Hello, Tangle!'

  inside path.join(__dirname, '..', '..'), (done) ->
    # Optionally add some grunt plugins from npm...
    #
    # grunt.loadNpmTasks 'grunt-contrib-clean'
    #
    done()

  grunt.registerTask 'default', 'Hello, tangle!', ->
    grunt.log.writeln grunt.config.get('greeting')
