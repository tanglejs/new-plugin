#!/usr/bin/env coffee

path = require 'path'
helpers = require('yeoman-generator').test

exports.command =
  description: 'Create a tangle plugin'

if require.main is module
  generator = require(path.join(__dirname, '..', 'subcommands', 'new'))
  helpers.createGenerator('tangle:plugin', [[generator, 'tangle:plugin']]).run()
