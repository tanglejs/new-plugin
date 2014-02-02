(function() {
  var helpers, path;

  path = require('path');

  helpers = require('yeoman-generator').test;

  describe('generator', function() {
    beforeEach(function(done) {
      return helpers.testDirectory(path.join(__dirname, 'tmp'), (function(_this) {
        return function(err) {
          if (err) {
            return done(err);
          }
          _this.app = helpers.createGenerator('tangle:plugin', [[require('../app/index.js'), 'tangle:plugin']]);
          return done();
        };
      })(this));
    });
    return it('creates expected files', function(done) {
      var expected;
      expected = ['.gitignore', '.editorconfig', '.travis.yml', 'package.json', 'Gruntfile.coffee', 'LICENSE-MIT', 'bin/tangle-test', 'src/index.coffee', 'src/tests/index_test.coffee', 'src/tests/config_file', 'readme/contributing.md', 'readme/examples.md', 'readme/license.md', 'readme/overview.md', 'readme/usage.md', 'readme/banner.md'];
      helpers.mockPrompt(this.app, {
        name: 'tangle-test-plugin',
        version: '0.1.0',
        description: 'A test plugin',
        subcommand: 'test',
        author: {
          name: 'Test Author',
          email: 'author@example.com',
          url: 'https://author.example.com'
        },
        githubUsername: 'testuser'
      });
      return this.app.run({}, function() {
        helpers.assertFiles(expected);
        return done();
      });
    });
  });

}).call(this);
