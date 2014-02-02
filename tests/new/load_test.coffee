assert = require('chai').assert
describe 'generator', ->
  it 'can be imported without blowing up', ->
    plugin = require '../../subcommands/new'
    assert plugin isnt `undefined`
