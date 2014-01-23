(function() {
  var PluginGenerator, path, util, yeoman,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  util = require('util');

  path = require('path');

  yeoman = require('yeoman-generator');

  module.exports = PluginGenerator = (function(_super) {
    __extends(PluginGenerator, _super);

    function PluginGenerator(args, options, config) {
      PluginGenerator.__super__.constructor.call(this, args, options, config);
      this.args = args;
      this.options = options;
      this.sourceRoot(path.join(__dirname, 'templates'));
      this.on('end', function() {
        require('fs').chmodSync("bin/tangle-" + this.app.subcommand, '1755');
        console.log("Next steps...\n");
        console.log("Build your plugin!\n");
        console.log('    $ npm install');
        console.log('    $ grunt');
        console.log("\nDevelop your plugin!\n");
        console.log('    $ npm link');
        console.log('    $ git init');
        console.log('    $ grunt watch');
        console.log("\n    * Write your code in src/index.coffee");
        console.log("    * Write your tests in src/tests/index_test.coffee");
        console.log("    * Write your documentation in readme/*.md");
        console.log("\nPublish your plugin!\n");
        console.log("    $ grunt bump:<major|minor|patch>");
        console.log("    $ git push origin master");
        console.log("    $ git push --tags");
        console.log("    $ npm publish");
        console.log("    $ npm unlink");
        return console.log("    $ npm install " + this.app.name + " -g\n");
      });
      this.pkg = JSON.parse(this.readFileAsString(path.join(__dirname, '../package.json')));
    }

    return PluginGenerator;

  })(yeoman.generators.Base);

  PluginGenerator.prototype.appPrompts = require('./prompts/app').prompt;

  PluginGenerator.prototype.authorPrompts = require('./prompts/author').prompt;

  PluginGenerator.prototype.copyFiles = function() {
    this.mkdir('bin');
    this.mkdir('readme');
    this.mkdir('src/tests');
    this.copy('gitignore', '.gitignore');
    this.copy('editorconfig', '.editorconfig');
    this.copy('travis.yml', '.travis.yml');
    this.copy('_LICENSE-MIT', 'LICENSE-MIT');
    this.copy('_package.json', 'package.json');
    this.copy('_Gruntfile.coffee', 'Gruntfile.coffee');
    this.copy('_index.coffee', "src/index.coffee");
    this.copy('_index_test.coffee', 'src/tests/index_test.coffee');
    this.copy('_config_file', 'src/tests/config_file');
    this.copy('_subcommand', "bin/tangle-" + this.app.subcommand);
    this.copy('readme/_contributing.md', "readme/contributing.md");
    this.copy('readme/_examples.md', "readme/examples.md");
    this.copy('readme/_license.md', "readme/license.md");
    this.copy('readme/_overview.md', "readme/overview.md");
    return this.copy('readme/_usage.md', "readme/usage.md");
  };

}).call(this);
