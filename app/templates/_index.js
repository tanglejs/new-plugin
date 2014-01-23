(function() {
  var conf, displayHelp, exec, nopt, parsedOptions, path;

  path = require('path');

  nopt = require('nopt');

  conf = require('tangle-config').getConf();

  exec = require('child_process').exec;

  displayHelp = function() {
    var cmd, manpage;
    manpage = path.join(__dirname, 'man', 'tangle-<%= app.subcommand %>.1');
    cmd = "man --local-file " + manpage;
    return exec(cmd, function(err, stdout, stderr) {
      process.stdout.write("" + stdout);
      process.stderr.write("" + stderr);
      if (err) {
        return console.error(err);
      }
    });
  };

  parsedOptions = nopt({
    option: String,
    help: Boolean
  }, {
    o: ['--option'],
    h: ['--help']
  }, process.argv, 2);

  if (parsedOptions.help) {
    displayHelp();
  } else if (parsedOptions.option) {

  } else {
    displayHelp();
  }

}).call(this);
