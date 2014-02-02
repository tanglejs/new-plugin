#!/usr/bin/env coffee

path = require 'path'
helpers = require('yeoman-generator').test

exports.command =
  description: '<%= plugin.description %>'

if require.main is module
  generator = require(path.join(__dirname, '..'))
  helpers.createGenerator('tangle:<%= plugin.subcommand %>', [[generator, 'tangle:<%= plugin.subcommand %>']]).run()
