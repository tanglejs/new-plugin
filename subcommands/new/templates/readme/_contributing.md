The test suite is implemented with
[nodeunit](https://github.com/caolan/nodeunit) and
[nixt](https://github.com/vesln/nixt).

To rebuild & run the tests

    $ git clone https://github.com/<%= author.github %>/<%= plugin.name %>.git
    $ cd <%= plugin.name %>
    $ npm install
    $ grunt test

You can use `grunt watch` to automatically rebuild and run the test suite when
files are changed.

Use `npm link` from the project directory to tell `tangle` to use
your modified `<%= plugin.name %>` during development.

To contribute back, fork the repo and open a pull request with your changes.
