(function() {
  var conf;

  conf = require('tangle-config').getConf();

  module.exports.prompt = function() {
    var done, prompts;
    done = this.async();
    prompts = [
      {
        type: 'input',
        name: 'name',
        message: 'Your name',
        "default": (function(_this) {
          return function() {
            return conf.get('user:name');
          };
        })(this)
      }, {
        type: 'input',
        name: 'email',
        message: 'Your email',
        "default": (function(_this) {
          return function() {
            return conf.get('user:email');
          };
        })(this)
      }, {
        type: 'input',
        name: 'url',
        message: 'Your homepage',
        "default": (function(_this) {
          return function() {
            return conf.get('user:url');
          };
        })(this)
      }, {
        type: 'input',
        name: 'github',
        message: 'Github username',
        "default": (function(_this) {
          return function() {
            return conf.get('user:github:username');
          };
        })(this)
      }
    ];
    return this.prompt(prompts, (function(_this) {
      return function(props) {
        _this.author = {
          name: props.name,
          email: props.email,
          url: props.url,
          github: props.github
        };
        return done();
      };
    })(this));
  };

}).call(this);
