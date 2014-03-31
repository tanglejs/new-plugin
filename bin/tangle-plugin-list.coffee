#!/usr/bin/env coffee

path = require 'path'

exports.command =
  description: 'Fetch and display all available plugins'

if require.main is module
  require path.join(__dirname, '..', 'subcommands', 'list', 'index.coffee')
