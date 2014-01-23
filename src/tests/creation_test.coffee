#global describe, beforeEach, it

path = require 'path'
helpers = require('yeoman-generator').test

describe 'generator', ->

  beforeEach (done) ->
    helpers.testDirectory path.join(__dirname, 'tmp'), (err) =>
      return done(err) if err
      @app = helpers.createGenerator('tangle:plugin', [
        ['../../app', 'tangle:plugin']
      ])
      done()

  it 'creates expected files', (done) ->
    
    # add files you expect to exist here.
    expected = [
      '.gitignore',
      '.editorconfig',
      '.travis.yml',
      'package.json',
      'Gruntfile.coffee',
      'LICENSE-MIT',
      'bin/tangle-test',
      'src/index.coffee',
      'src/tests/index_test.coffee',
      'src/tests/config_file',
      'readme/contributing.md',
      'readme/examples.md',
      'readme/license.md',
      'readme/overview.md',
      'readme/usage.md',
      'readme/banner.md'
    ]
    helpers.mockPrompt @app,
      name: 'tangle-test-plugin'
      version: '0.1.0'
      description: 'A test plugin'
      subcommand: 'test'
      author:
        name: 'Test Author'
        email: 'author@example.com'
        url: 'https://author.example.com'
      githubUsername: 'testuser'

    @app.run {}, ->
      helpers.assertFiles expected
      done()
