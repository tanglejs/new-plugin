helmsman = require 'helmsman'

cli = helmsman
  localDir: 'bin'
  prefix: 'tangle-plugin'
  usePath: true

cli.on '--help', ->
  console.log "\ntangle-plugin - tools for working with tangle plugins"
  console.log "\nFor detailed usage, view \"man tangle-plugin\"."

argv = process.argv

cli.parse(argv)
