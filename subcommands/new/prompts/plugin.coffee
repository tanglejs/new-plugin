path = require 'path'

module.exports.prompt =  ->
  done = @async()

  prompts = [
    type: 'input'
    name: 'plugin:name'
    message: 'Plugin name'
    default: =>
      path.basename( process.cwd() )
  ,
    type: 'input'
    name: 'plugin:subcommand'
    message: 'subcommand'
  ,
    type: 'list'
    name: 'plugin:type'
    message: 'type'
    choices: ['runner', 'generator', 'scope']
  ,
    type: 'input'
    name: 'plugin:version'
    message: 'Current version'
    default: '0.0.0'
  ,
    type: 'input'
    name: 'plugin:description'
    message: 'Description'
  ]

  @prompt prompts, (props) =>
    @plugin =
      name: props['plugin:name']
      version: props['plugin:version']
      description: props['plugin:description']
      subcommand: props['plugin:subcommand']
      type: props['plugin:type']
    done()
