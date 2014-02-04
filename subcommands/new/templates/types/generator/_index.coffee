<% className =  _.classify(plugin.subcommand) + 'Generator' %>
path = require 'path'
yeoman = require 'yeoman-generator'
_ = require 'lodash'
_.str = require 'underscore.string'

module.exports = class <%= className %> extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super(args, options, config)
    @args = args
    @options = options
    @sourceRoot path.join __dirname, 'templates'

    @on 'end', ->
      # Perform any post-generation tasks here. Perhaps tell the user
      # what to do next?

<%= className %>::Prompts =  ->
  done = @async()

  # See https://github.com/SBoudrias/Inquirer.js/blob/master/README.md
  @prompt [
    type: 'input', name: '<%= _.underscored(plugin.subcommand) %>:greeting', message: 'Greeting', default: 'Hello',
  ], (settings) =>
    @settings = settings
    done()

<%= className %>::doSomeWork = ->
  @mkdir 'hello-world'
  @copy '_hello.txt', 'hello-world/hello.txt'
