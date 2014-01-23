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
      require('fs').chmodSync "bin/tangle-#{@app.subcommand}", '1755'

      console.log "Next steps...\n"
      console.log "Build your plugin!\n"
      console.log '    $ npm install'
      console.log '    $ grunt'
      console.log "\nDevelop your plugin!\n"
      console.log '    $ npm link'
      console.log '    $ git init'
      console.log '    $ grunt watch'
      console.log "\n    * Write your code in src/index.coffee"
      console.log "    * Write your tests in src/tests/index_test.coffee"
      console.log "    * Write your documentation in readme/*.md"
      console.log "\nPublish your plugin!\n"
      console.log "    $ grunt bump:<major|minor|patch>"
      console.log "    $ git push origin master"
      console.log "    $ git push --tags"
      console.log "    $ npm publish"
      console.log "    $ npm unlink"
      console.log "    $ npm install #{@app.name} -g\n"

    @pkg = JSON.parse(@readFileAsString(path.join(__dirname, '../package.json')))

PluginGenerator::appPrompts = require('./prompts/app').prompt
PluginGenerator::authorPrompts = require('./prompts/author').prompt

PluginGenerator::copyFiles = ->
  @mkdir 'bin'
  @mkdir 'readme'
  @mkdir 'src/tests'
  @copy 'gitignore', '.gitignore'
  @copy 'editorconfig', '.editorconfig'
  @copy 'travis.yml', '.travis.yml'
  @copy '_LICENSE-MIT', 'LICENSE-MIT'
  @copy '_package.json', 'package.json'
  @copy '_Gruntfile.coffee', 'Gruntfile.coffee'
  @copy '_index.coffee', 'src/index.coffee'
  @copy '_index_test.coffee', 'src/tests/index_test.coffee'
  @copy '_config_file', 'src/tests/config_file'
  @copy '_subcommand', "bin/tangle-#{@app.subcommand}"
  @copy 'readme/_contributing.md', 'readme/contributing.md'
  @copy 'readme/_examples.md', 'readme/examples.md'
  @copy 'readme/_license.md', 'readme/license.md'
  @copy 'readme/_overview.md', 'readme/overview.md'
  @copy 'readme/_usage.md', 'readme/usage.md'
  @copy 'readme/_banner.md', 'readme/banner.md'
