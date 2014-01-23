assert = require 'assert'
describe 'generator', ->

  it 'can be imported without blowing up', ->

    app = require '../app'
    assert app isnt `undefined`
