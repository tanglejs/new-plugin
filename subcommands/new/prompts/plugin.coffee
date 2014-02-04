path = require 'path'

module.exports.prompt =  ->
  done = @async()
  pluginConfig = require('tangle-config').getProject()

  prompts = [
    type: 'input'
    name: 'plugin:name'
    message: 'Plugin name'
    default: =>
      pluginConfig.get('plugin:name') || path.basename( process.cwd() )
  ,
    type: 'input'
    name: 'plugin:subcommand'
    message: 'subcommand'
    default: => pluginConfig.get 'plugin:subcommand'
  ,
    type: 'list'
    name: 'plugin:type'
    message: 'type'
    choices: ['runner', 'generator', 'scope']
    default: => pluginConfig.get 'plugin:type'
  ,
    type: 'input'
    name: 'plugin:version'
    message: 'Current version'
    default: '0.0.0'
    default: => pluginConfig.get 'plugin:version'
  ,
    type: 'input'
    name: 'plugin:description'
    message: 'Description'
    default: => pluginConfig.get 'plugin:description'
  ]

  @prompt prompts, (props) =>
    @plugin =
      name: props['plugin:name']
      version: props['plugin:version']
      description: props['plugin:description']
      subcommand: props['plugin:subcommand']
      type: props['plugin:type']
    done()
