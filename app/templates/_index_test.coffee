nixt = require 'nixt'

showHelp = (result) ->
  if !(result.stdout.match(/--help/))
    return new Error('--help should be mentioned')

exports.group =

  'No options': (test) ->
    test.doesNotThrow ->
      nixt()
        .expect(showHelp)
        .run('bin/tangle-<%= app.subcommand %>')
        .code(0)
        .end(test.done)

  '--help': (test) ->
    test.doesNotThrow ->
      nixt()
        .expect(showHelp)
        .run('bin/tangle-<%= app.subcommand %> --help')
        .code(0)
        .end(test.done)
