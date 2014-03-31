#
# * tangle-new-plugin
# * https://github.com/tanglejs/new-plugin
# *
# * Copyright (c) 2014 Logan Koester
# * Licensed under the MIT license.
#

path = require 'path'
tangleUtil = require 'tangle-util'

module.exports = (grunt) ->
  #
  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    clean:
      docs: ['man/']
      tests: ['tests/tmp/']

    watch:
      all:
        files: [
          'bin/**/*'
          'Gruntfile.coffee'
          'subcommands/*/templates/**/*'
          'subcommands/**/*.coffee'
          'readme/**/*.md'
          'tests/**/*.coffee'
          '!tests/tmp/**/*'
        ]
        tasks: ['default']

    mochacli:
      options:
        compilers: ['coffee:coffee-script/register']
      all: ['tests/**/*_test.coffee']

    readme_generator:
      help:
        options:
          output: 'tangle-plugin.md'
          table_of_contents: false
          generate_footer: false
          has_travis: false
          package_title: 'tangle-plugin'
          package_name: 'tangle-plugin'
        order:
          'overview.md': 'OVERVIEW'
          'usage.md': 'USAGE'

      new:
        options:
          output: 'tangle-plugin-new.md'
          table_of_contents: false
          generate_footer: false
          has_travis: false
          package_title: 'tangle-plugin-new'
          package_name: 'tangle-plugin-new'
          package_desc: 'Create a new plugin'
        order:
          'subcommands/new/overview.md': 'OVERVIEW'
          'subcommands/new/configure.md': 'CONFIGURE'
          'subcommands/new/create.md': 'CREATE'
          'subcommands/new/edit.md': 'EDIT'
          'subcommands/new/publish.md': 'PUBLISH'

      list:
        options:
          output: 'tangle-plugin-list.md'
          table_of_contents: false
          generate_footer: false
          has_travis: false
          package_title: 'tangle-plugin-list'
          package_name: 'tangle-plugin-list'
          package_desc: 'Display a table of all available plugins'
        order:
          'subcommands/list/overview.md': 'OVERVIEW'

      readme:
        options:
          banner: 'banner.md'
          generate_title: false
          has_travis: false
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
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-readme-generator'
  grunt.loadNpmTasks 'grunt-mocha-cli'
  grunt.loadNpmTasks 'grunt-bump'

  tangleUtil.grunt.registerMarkedMan 'manpage-plugin', grunt,
    path.join(__dirname, 'tangle-plugin.md'),
    path.join(__dirname, 'man', 'tangle-plugin.1')

  tangleUtil.grunt.registerMarkedMan 'manpage-plugin-new', grunt,
    path.join(__dirname, 'tangle-plugin-new.md'),
    path.join(__dirname, 'man', 'tangle-plugin-new.1')

  tangleUtil.grunt.registerMarkedMan 'manpage-plugin-list', grunt,
    path.join(__dirname, 'tangle-plugin-list.md'),
    path.join(__dirname, 'man', 'tangle-plugin-list.1')

  grunt.registerTask 'build', [
    'clean'
    'readme_generator'
    'manpage-plugin'
    'manpage-plugin-new'
    'manpage-plugin-list'
  ]

  grunt.registerTask 'test', ['mochacli']
  grunt.registerTask 'default', ['build', 'test']
