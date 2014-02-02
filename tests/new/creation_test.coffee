path = require 'path'
helpers = require('yeoman-generator').test
assert = require('chai').assert

asyncStub =
  on: (key, cb) ->
    if key is 'exit' then cb()
    return asyncStub;

describe 'generator', ->

  beforeEach (done) ->
    helpers.testDirectory path.join(__dirname, '..', 'tmp'), (err) =>
      return done(err) if err
      @plugin = helpers.createGenerator('tangle:plugin', [
        [require('../../subcommands/new'), 'tangle:plugin']
      ])

      # Keep track of all commands executed by spawnCommand
      @commandsRun = []
      @plugin.spawnCommand = (cmd, args) =>
        @commandsRun.push [cmd, args]
        return asyncStub
      done()

  it 'installs npm dependencies', (done) ->
    @plugin.installDependencies =>
      console.log @commandsRun
      assert.deepEqual(@commandsRun, [['bower', ['install']], ['npm', ['install']]])
      done()

  describe 'output', ->
    beforeEach (done) ->
      helpers.mockPrompt @plugin,
        'plugin:name': 'tangle-test-plugin'
        'plugin:version': '0.1.0'
        'plugin:description': 'A test plugin'
        'plugin:subcommand': 'stubplugin'
        'author:name': 'Test Author'
        'author:email': 'author@example.com'
        'author:url': 'https://author.example.com'
        'author:githubUsername': 'testuser'
      done()

    it 'includes expected files', (done) ->
      # add files you expect to exist here.
      expected = [
        '.gitignore'
        '.editorconfig'
        '.travis.yml'
        'package.json'
        'Gruntfile.coffee'
        'LICENSE-MIT'
        'bin/tangle-stubplugin.coffee'
        'src/index.coffee'
        'readme/contributing.md'
        'readme/examples.md'
        'readme/license.md'
        'readme/overview.md'
        'readme/usage.md'
        'readme/banner.md'
      ]

      @plugin.run {}, ->
        helpers.assertFiles expected
        done()
