util = require 'util'
path = require 'path'
yeoman = require 'yeoman-generator'

module.exports = class PluginGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super(args, options, config)
    @args = args
    @options = options

    @sourceRoot path.join __dirname, 'templates'

    @on 'end', ->
      require('fs').chmodSync "bin/tangle-#{@plugin.subcommand}.coffee", '1755'
      @installDependencies npm: true

      console.log "Next steps...\n"
      console.log "Build your plugin!\n"
      console.log '    $ grunt'
      console.log "\nDevelop your plugin!\n"
      console.log '    $ npm link'
      console.log '    $ git init'
      console.log '    $ grunt watch'
      console.log "Write your code, documentation and tests"
      console.log "    * CoffeeScript"
      console.log "    * Markdown"
      console.log "    * Mocha + Chai"
      console.log "\nPublish your plugin!\n"
      console.log "    $ grunt bump:<major|minor|patch>"
      console.log "    $ git push origin master"
      console.log "    $ git push --tags"
      console.log "    $ npm publish"
      console.log "    $ npm unlink"
      console.log "    $ npm install #{@plugin.name} -g\n"

PluginGenerator::pluginPrompts = require('./prompts/plugin').prompt
PluginGenerator::authorPrompts = require('./prompts/author').prompt

PluginGenerator::copyFiles = ->
  @mkdir 'bin'
  @mkdir 'readme'
  @mkdir 'node_modules'
  @mkdir 'subcommands'
  @mkdir 'tests'
  @copy 'gitignore', '.gitignore'
  @copy 'editorconfig', '.editorconfig'
  @copy 'travis.yml', '.travis.yml'
  @copy '_package.json', 'package.json'
  @copy '_Gruntfile.coffee', 'Gruntfile.coffee'
  @copy '_index.coffee', 'src/index.coffee'
  @copy 'bin/_tangle-subcommand.coffee', "bin/tangle-#{@plugin.subcommand}.coffee"

PluginGenerator::copyDocs = ->
  @copy '_LICENSE-MIT', 'LICENSE-MIT'
  @copy 'readme/_contributing.md', 'readme/contributing.md'
  @copy 'readme/_examples.md', 'readme/examples.md'
  @copy 'readme/_license.md', 'readme/license.md'
  @copy 'readme/_overview.md', 'readme/overview.md'
  @copy 'readme/_usage.md', 'readme/usage.md'
  @copy 'readme/_banner.md', 'readme/banner.md'
