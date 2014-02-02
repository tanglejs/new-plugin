#!/usr/bin/env coffee
 
 exports.command =
   description: '<%= plugin.description %>'
 
 if require.main is module
   path = require 'path'
   grunt = require 'grunt'
 
   grunt.cli
     gruntfile: path.join(__dirname, '..', 'index.coffee')
     base: process.cwd()
