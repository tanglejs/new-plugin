(function() {
  var path;

  path = require('path');

  module.exports = function(grunt) {
    grunt.initConfig({
      pkg: grunt.file.readJSON('package.json'),
      coffee: {
        src: {
          expand: true,
          cwd: 'src/',
          src: '**/*.coffee',
          dest: '.',
          ext: '.js'
        }
      },
      copy: {
        src: {
          expand: true,
          cwd: 'src/tests',
          src: 'config_file',
          dest: 'tests/'
        }
      },
      clean: {
        lib: ['lib/', 'tests/', 'man/']
      },
      watch: {
        all: {
          files: ['src/**/*.coffee', 'bin/**/*.coffee', 'Gruntfile.coffee', 'readme/**/*.md'],
          tasks: ['default']
        }
      },
      nodeunit: {
        all: ['tests/**/*_test.js']
      },
      readme_generator: {
        help: {
          options: {
            output: 'tangle-<%= app.subcommand %>.md',
            table_of_contents: false,
            generate_footer: false,
            has_travis: false,
            package_title: 'tangle-<%= app.subcommand %>',
            package_name: 'tangle-<%= app.subcommand %>'
          },
          order: {
            'usage.md': 'Usage',
            'examples.md': 'Examples'
          }
        },
        readme: {
          options: {
            github_username: '<%= author.github %>',
            generate_footer: false,
            table_of_contents: false
          },
          order: {
            'overview.md': 'Overview',
            'usage.md': 'Usage',
            'examples.md': 'Examples',
            'contributing.md': 'Contributing',
            'license.md': 'License'
          }
        }
      },
      bump: {
        options: {
          commit: true,
          commitMessage: 'Release v%VERSION%',
          commitFiles: ['package.json'],
          createTag: true,
          tagName: 'v%VERSION%',
          tagMessage: 'Version %VERSION%',
          push: false
        }
      }
    });
    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-contrib-nodeunit');
    grunt.loadNpmTasks('grunt-readme-generator');
    grunt.loadNpmTasks('grunt-bump');
    grunt.registerTask('marked-man', function() {
      var done;
      done = this.async();
      return grunt.util.spawn({
        cmd: './marked-man',
        args: [path.join(__dirname, 'tangle-<%= app.subcommand %>.md')],
        opts: {
          cwd: path.join(__dirname, 'node_modules', 'marked-man', 'bin')
        }
      }, function(error, result, code) {
        var out;
        if (error) {
          throw error;
        }
        out = path.join(__dirname, 'man', 'tangle-<%= app.subcommand %>.1');
        grunt.file.write(out, result.stdout);
        return done();
      });
    });
    grunt.registerTask('build', ['clean', 'coffee', 'copy', 'readme_generator', 'marked-man']);
    grunt.registerTask('test', ['nodeunit']);
    return grunt.registerTask('default', ['build', 'test']);
  };

}).call(this);
