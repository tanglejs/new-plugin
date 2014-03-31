# tangle-plugin-new 

> Create a new plugin

## OVERVIEW


This task runs interactively. It will ask you to answer some
questions about the plugin you are creating, and then generate the necessary
files in the current directory.



## CONFIGURE


If these global config values are set, they will be used as defaults.

    $ tangle config -k user:name -v "Your name"
    $ tangle config -k user:email -v "you@example.com"
    $ tangle config -k user:url -v "http://yourhomepage.example"
    $ tangle config -k user:github:username -v 'yourUsername'


## CREATE


    $ mkdir tangle-myplugin
    $ cd tangle-myplugin

    $ tangle plugin new
    # ...



## EDIT


    $ npm link
    $ grunt watch # Automatically rebuild & test on file change events



## PUBLISH


    $ npm publish
    $ npm unlink
    $ npm install tangle-myplugin -g


