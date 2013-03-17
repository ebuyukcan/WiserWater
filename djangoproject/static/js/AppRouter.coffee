AppRouter = Backbone.Router.extend
  
  # Don't seem to need the following
  initialize: ->
    @historyBack = false
    @pages = {}

    console.debug "Initialized AppRouter"

  # define the route and function maps for this router
  # Sample usage: http://example.com/#input
  routes:
    "": "renderHome"
    "/input": "renderInput"
    "/lake": "renderLake"
         # This is an example of using a ":param" variable which allows us to match
         # any of the components between two URL slashes 
         # Sample usage: http://example.com/#lake/5 
    "/profile": "renderProfile"
    "/searchmap": "renderSearchByMap"
    "/searchname": "renderSearchByName"
    "*other": "defaultRoute"
         # This is a default route that also uses a *splat. Consider the
         # default route a wildcard for URLs that are either not matched or where
         # the user has incorrectly typed in a route path manually 

  defaultRoute: (other) ->
    console.log "Invalid. You attempted to reach:" + other

  renderHome: ->
    console.debug "Rendering home"
    @setPage $("#content"), new WiserWater.HomeView({el: $("#content")})
    return @

  renderInput: ->
    console.debug "Rendering input"
    @setPage $("#content"), new WiserWater.InputView()
    return @	

  renderNavigate: ->
    console.debug "Rendering navigate"

  renderLake: (item) ->
    @setPage $("#content"), new WiserWater.LakeView(item)
    return@
    
  renderProfile: ->
    console.debug "Rendering profile"
    @setPage $("#content"), new WiserWater.ProfileView()
    return @	

  renderSearchByMap: ->
    console.debug "Rendering search by map"
    @setPage $("#content"), new WiserWater.SearchByMapView()
    return @	

  renderSearchByName: ->
    console.debug "Rendering search by name"
    @setPage $("#content"), new WiserWater.SearchByNameView()
    return @	

  renderCamera: ->
    view =  new WiserWater.CameraView()
    @setPage $("#content"), view
    view.snapPhoto()
    return @
	
  renderFeedback: (cleanliness) ->
    console.debug "Rendering feedback" + cleanliness
    @setPage $("#content"), new WiserWater.FeedbackView({cleanliness: cleanliness})
    return @

  renderOxygen: ->
    console.debug "Rendering oxygen"
    @setPage $("#content"), new WiserWater.OxygenView()
    return @

  renderPh: ->
    console.debug "Rendering pH"
    @setPage $("#content"), new WiserWater.pHView()
    return @
	
  setPage: (target, view, header, footer) ->
    # Changes the page using the backbone framework, no transitions
    header ?= new WiserWater.HeaderView()
    footer ?= new WiserWater.FooterView()
    $("#header").html(header.render().el).trigger("create")
    $("#footer").html(footer.render().el).trigger("create")
    if view?
      target.html $(view.render().el)
      target.trigger("create")

  changePageJQM: (page) ->
        # Not working :( Changes the page using the JQM framework, having the nice transitions
        $(page.el).attr('data-role', 'page')
        page.render
        $('body').append $(page.el)
        $.mobile.changePage $(page.el), {changeHash:false}

# myAppRouter = new AppRouter
