path = require 'path'
nopt = require 'nopt'
conf = require('tangle-config').getConf()
exec = require('child_process').exec

displayHelp = ->
  manpage = path.join(__dirname, 'man', 'tangle-<%= app.subcommand %>.1')
  cmd = "man --local-file #{manpage}"
  exec cmd, (err, stdout, stderr) ->
    process.stdout.write "#{stdout}"
    process.stderr.write "#{stderr}"
    console.error err if err

parsedOptions = nopt
  option: String
  help: Boolean
,
  o: ['--option']
  h: ['--help']
, process.argv, 2

if parsedOptions.help
  displayHelp()

else if parsedOptions.option

  # YOUR CODE HERE
  #
  # Examples:
  #
  #   # Retrieve some item from the tangle-config key/value store
  #   someKey = conf.get 'some:key'

  # ...

else
  displayHelp()
