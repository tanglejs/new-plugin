(function() {
  var path;

  path = require('path');

  module.exports.prompt = function() {
    var done, prompts;
    done = this.async();
    prompts = [
      {
        type: 'input',
        name: 'name',
        message: 'Plugin name',
        "default": (function(_this) {
          return function() {
            return path.basename(process.cwd());
          };
        })(this)
      }, {
        type: 'input',
        name: 'version',
        message: 'Current version',
        "default": '0.0.0'
      }, {
        type: 'input',
        name: 'description',
        message: 'Description'
      }, {
        type: 'input',
        name: 'subcommand',
        message: 'subcommand'
      }
    ];
    return this.prompt(prompts, (function(_this) {
      return function(props) {
        _this.app = {
          name: props.name,
          version: props.version,
          description: props.description,
          subcommand: props.subcommand
        };
        return done();
      };
    })(this));
  };

}).call(this);
