#!/usr/bin/env coffee

path = require 'path'

exports.command =
  description: 'Tools for working with tangle plugins'
  arguments: null # Optional arguments string to display

if require.main is module
  require path.join(__dirname, '..', 'index.coffee')
