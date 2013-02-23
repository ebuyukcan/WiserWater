AppRouter = Backbone.Router.extend
  
  initialize: ->
    @historyBack = false
    @pages = {}

    console.debug "Initialized AppRouter"

  routes:
    "": "renderHome"

  renderHome: ->
    console.debug "Rendering home"
    # Here we will need to call a view
    return @