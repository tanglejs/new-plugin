#
# * tangle-new-plugin
# * https://github.com/tanglejs/new-plugin
# *
# * Copyright (c) 2014 Logan Koester
# * Licensed under the MIT license.
#

path = require 'path'

module.exports = (grunt) ->
  #
  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    # Coffeescript
    coffee:
      src:
        expand: true
        cwd: 'src/'
        src: '**/*.coffee'
        dest: '.'
        ext: '.js'

    copy:
      templates:
        expand: true
        cwd: 'src/app/templates'
        src: '**/*'
        dest: 'app/templates'

    clean:
      lib: ['lib/', 'tests/', 'man/', 'app/']

    watch:
      all:
        files: [
          'src/**/*.coffee',
          'bin/**/*.coffee',
          'Gruntfile.coffee',
          'readme/**/*.md'
        ]
        tasks: ['default']

    mochacli:
      all: ['tests/**/*.js']

    readme_generator:
      help:
        options:
          output: 'tangle-new.md'
          table_of_contents: false
          generate_footer: false
          has_travis: false
          package_title: 'tangle-new'
          package_name: 'tangle-new'
        order:
          'usage.md': 'Usage'
      readme:
        options:
          banner: 'banner.md'
          github_username: 'tanglejs'
          generate_footer: false
          table_of_contents: false
        order:
          'overview.md': 'Overview'
          'usage.md': 'Usage'
          'contributing.md': 'Contributing'
          'license.md': 'License'

    bump:
      options:
        commit: true
        commitMessage: 'Release v%VERSION%'
        commitFiles: ['package.json']
        createTag: true
        tagName: 'v%VERSION%'
        tagMessage: 'Version %VERSION%'
        push: false

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-readme-generator'
  grunt.loadNpmTasks 'grunt-mocha-cli'
  grunt.loadNpmTasks 'grunt-bump'

  grunt.registerTask 'marked-man', ->
    done = @async()
    grunt.util.spawn
      cmd: './marked-man'
      args: [path.join(__dirname, 'tangle-new.md')]
      opts:
        cwd: path.join(__dirname, 'node_modules', 'marked-man', 'bin')
    , (error, result, code) ->
      throw error if error
      out = path.join __dirname, 'man', 'tangle-new.1'
      grunt.file.write out, result.stdout
      done()

  grunt.registerTask 'build', ['clean', 'coffee', 'copy', 'readme_generator', 'marked-man']
  grunt.registerTask 'test', ['mochacli']
  grunt.registerTask 'default', ['build', 'test']
