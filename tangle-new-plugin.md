# tangle-new-plugin 

> A tangle plugin for creating new tangle plugins

## Usage

### Global configuration

If you these config values are set, they will be used as defaults.

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


