AppRouter = Backbone.Router.extend
  
  initialize: ->
    @historyBack = false
    @pages = {}

    console.debug "Initialized AppRouter"

  routes:
    "": "renderHome"

  renderHome: ->
    console.debug "Rendering home"
    @setPage $("#page"), new WiserWater.HomeView()
    return @

  setPage: (target, view) ->
        # Changes the page using the backbone framework, no transitions
        if view?
            target.html $(view.render().el)
            target.trigger("create")

  changePageJQM: (page) ->
        # Not working :( Changes the page using the JQM framework, having the nice transitions
        $(page.el).attr('data-role', 'page')
        page.render
        $('body').append $(page.el)
        $.mobile.changePage $(page.el), {changeHash:false}