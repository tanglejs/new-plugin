helmsman = require 'helmsman'

cli = helmsman
  localDir: 'bin'
  prefix: 'tangle-<%= plugin.submodule %>'
  usePath: true

cli.on '--help', ->
  console.log "\ntangle-<%= plugin.submodule %> - <%= plugin.description %>"
  console.log "\nFor detailed usage, view \"man tangle-<%= plugin.submodule %>\"."

argv = process.argv

cli.parse(argv)
