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

A TangleJS plugin is any npm module that includes 'tangle-plugin' in the
keywords array of its package.json.

Unlike Bower components or other npm modules, plugins are extensions to the
TangleJS system, not to your projects. Most plugins provide some additional
subcommand of `tangle` for you to work with.


## Usage

    --option, -o [String] - An example option.
    --help, -h - Display this message


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


