_ = require 'lodash'
Table = require 'cli-table'

search = require('getpackages').create()

search.fetchPackagesByKeyword 'tangle-plugin', (err, entries) ->

  table = new Table
    head: [
      'Plugin'
      'Latest'
      'Description'
    ]
    colWidths: [20, 10, 60]

  _.each entries, (entry) ->
    row = [
      entry.name
      entry.version
      entry.description
    ]
    table.push row

  console.log table.toString()
