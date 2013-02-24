AppRouter = Backbone.Router.extend
  
  initialize: ->
    @historyBack = false
    @pages = {}

    console.debug "Initialized AppRouter"

  # define the route and function maps for this router
  # Sample usage: http://example.com/#input
  routes:
    "": "renderHome"
    "input": "renderInput"
    "lake/:id": "renderLake"
         # This is an example of using a ":param" variable which allows us to match
         # any of the components between two URL slashes 
         # Sample usage: http://example.com/#lake/5 
    "profile": "renderProfile"
    "searchmap": "renderSearchByMap"
    "searchname": "renderSearchByName"
    "*other": "defaultRoute"
         # This is a default route that also uses a *splat. Consider the
         # default route a wildcard for URLs that are either not matched or where
         # the user has incorrectly typed in a route path manually 

  defaultRoute: (other) ->
    console.log "Invalid. You attempted to reach:" + other

  renderHome: ->
    console.debug "Rendering home"
    @setPage $("#content"), new WiserWater.HomeView()
    return @

  renderInput: ->
    console.debug "Rendering input"
    @setPage $("#content"), new WiserWater.InputView()
    return @	

  renderNavigate: ->
    console.debug "Rendering navigate"

  renderLake: (lakeId) ->
        # Note that the id matched in the above route will be passed to this function
    console.log "You are trying to reach lake " + lakeId
    #if not lakeId
    @setPage $("#content"), new WiserWater.LakeView()
    console.debug "Invalid lake id"
    return@
  #    if not lakeId
  #    console.debug "Invalid lake id"
  #     return@
    #console.debug "Rendering lake view"

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
    console.debug "Rendering camera"
    view =  new WiserWater.CameraView()
    @setPage $("#content"), view
    view.snapPhoto()
    return @
	
  renderFeedback: ->
    console.debug "Rendering feedback"
    @setPage $("#content"), new WiserWater.FeedbackView()
    return @

  renderOxygen: ->
    console.debug "Rendering oxygen"
    @setPage $("#content"), new WiserWater.OxygenView()
    return @

  
  renderProfile: ->
    console.debug "Rendering profile"
    @setPage $("#content"), new WiserWater.ProfileView()
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
