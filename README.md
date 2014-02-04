# tangle-plugin

> A tangle plugin for managing tangle plugins

[![Strider Build Status](http://ci.ldk.io/tanglejs/plugin/badge)](https://ci.ldk.io/tanglejs/plugin/)
[![Travis Build Status](https://secure.travis-ci.org/tanglejs/plugin.png?branch=master)](http://travis-ci.org/tanglejs/plugin)
[![Dependency Status](https://david-dm.org/tanglejs/plugin.png)](https://david-dm.org/tanglejs/plugin)
[![devDependency Status](https://david-dm.org/tanglejs/plugin/dev-status.png)](https://david-dm.org/tanglejs/plugin#info=devDependencies)
[![Gittip](http://img.shields.io/gittip/logankoester.png)](https://www.gittip.com/logankoester/)

[![NPM](https://nodei.co/npm/tangle-plugin.png?downloads=true)](https://nodei.co/npm/tangle-plugin/)


## Overview

[tangle](https://github.com/tanglejs/tangle) is a set of tools
for building web applications.

`tangle-new-plugin` implements the `new-plugin` subcommand for
[tangle](https://github.com/tanglejs/tangle).

It also happens to be a generator for [Yeoman](http://yeoman.io), though
it does not follow the `generator-` naming convention.

`tangle-new-plugin` runs interactively. It will ask you to answer some
questions about the plugin you are creating, and then generate the necessary
files in the current directory.


## Usage

### Global configuration

If these config values are set, they will be used as defaults.

    $ tangle config -k user:name -v "Your name"
    $ tangle config -k user:email -v "you@example.com"
    $ tangle config -k user:url -v "http://yourhomepage.example"
    $ tangle config -k user:github:username -v 'yourUsername'

### Creating your plugin

    $ mkdir tangle-myplugin
    $ cd tangle-myplugin

    $ tangle new-plugin
    # ...

### Editing your plugin

    $ npm link
    $ grunt watch # Automatically rebuild & test on file change events

### Publishing your plugin

    $ npm publish
    $ npm unlink
    $ npm install tangle-myplugin -g


## Contributing

To rebuild & run the tests

    $ mkdir tanglejs
    $ cd tanglejs
    $ git clone https://github.com/tanglejs/new-plugin.git
    $ cd new
    $ npm install
    $ grunt test

You can use `grunt watch` to automatically rebuild and run the test suite when
files are changed.

Use `npm link` from the project directory to tell `tangle` to use
your modified `tangle-new-plugin` during development.

To contribute back, fork the repo and open a pull request with your changes.


## License

Copyright (c) 2014 Logan Koester
Licensed under the MIT license.


