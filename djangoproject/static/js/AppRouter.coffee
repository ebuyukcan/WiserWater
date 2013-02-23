AppRouter = Backbone.Router.extend
  
  initialize: ->
    @historyBack = false
    @pages = {}

    console.debug "Initialized AppRouter"

  routes:
    "": "renderHome"

  renderHome: ->
    console.debug "Rendering home"
    @setPage $("#home"), new WiserWater.HomeView()
    return @

  setPage: (target, view) ->
        if view?
            target.html $(view.render().el)