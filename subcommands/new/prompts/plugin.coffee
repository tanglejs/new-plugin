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
    name: 'plugin:version'
    message: 'Current version'
    default: '0.0.0'
  ,
    type: 'input'
    name: 'plugin:description'
    message: 'Description'
  ,
    type: 'input'
    name: 'plugin:subcommand'
    message: 'subcommand'
  ]

  @prompt prompts, (props) =>
    @plugin =
      name: props['plugin:name']
      version: props['plugin:version']
      description: props['plugin:description']
      subcommand: props['plugin:subcommand']
    done()
