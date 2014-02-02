_ = require 'lodash'
path = require 'path'
chai = require 'chai'
yeomanGenerator = require 'yeoman-generator'
yeomanTest = yeomanGenerator.test

module.exports = helpers =
  tmpDir: path.join(__dirname, '..', 'tmp')
  path: path
  assert: chai.assert
  assertFiles: yeomanTest.assertFiles
  mockPrompt: yeomanTest.mockPrompt
  testDirectory: yeomanTest.testDirectory
  createGenerator: yeomanTest.createGenerator

  createPlugin: (done) ->
    helpers.testDirectory helpers.tmpDir, (err) =>
      return done(err) if err
      @plugin = helpers.createGenerator('tangle:plugin', [
        [require('../../subcommands/new'), 'tangle:plugin']
      ])

      asyncStub =
        on: (key, cb) ->
          if key is 'exit' then cb()
          return asyncStub

      # Keep track of all commands executed by spawnCommand
      @commandsRun = []
      @plugin.spawnCommand = (cmd, args) =>
        @commandsRun.push [cmd, args]
        return asyncStub
      done()

  promptDefaults:
    'plugin:name': 'tangle-test-plugin'
    'plugin:version': '0.1.0'
    'plugin:description': 'A test plugin'
    'plugin:subcommand': 'stubplugin'
    'author:name': 'Test Author'
    'author:email': 'author@example.com'
    'author:url': 'https://author.example.com'
    'author:githubUsername': 'testuser'

  answerPrompts: (options) ->
    _.defaults _.clone(helpers.promptDefaults), options

  pluginFiles: [
    '.gitignore'
    '.editorconfig'
    '.travis.yml'
    'package.json'
    'Gruntfile.coffee'
    'LICENSE-MIT'
    'bin/tangle-stubplugin.coffee'
    'index.coffee'
    'readme/contributing.md'
    'readme/license.md'
    'readme/overview.md'
    'readme/usage.md'
    'readme/banner.md'
  ]
