module.exports.prompt =  ->
  done = @async()

  prompts = [
    type: 'input'
    name: 'name'
    message: 'Your name'
    #default: =>
    #  @config.get('user.name')
  ,
    type: 'input'
    name: 'email'
    message: 'Your email'
    #default: =>
    #  @config.get('user.email')
  ,
    type: 'input'
    name: 'url'
    message: 'Your homepage'
    #default: =>
    #  @config.get('user.url')
  ,
    type: 'input'
    name: 'github'
    message: 'Github username'
    #default: =>
    #  @config.get('user.github.username')
  ]

  @prompt prompts, (props) =>
    @author =
      name: props.name
      email: props.email
      url: props.url
      github: props.github
    done()
