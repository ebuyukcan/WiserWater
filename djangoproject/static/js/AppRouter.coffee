AppRouter = Backbone.Router.extend
  
  initialize: ->
    @historyBack = false
    @pages = {}

    console.debug "Initialized AppRouter"

  routes:
    "": "renderHome"
    "input": "renderInput"

  renderHome: ->
    console.debug "Rendering home"
    @setPage $("#content"), new WiserWater.HomeView()
    return @

  renderInput: ->
    console.debug "Rendering input"

  renderNavigate: ->
    console.debug "Rendering navigate"

  renderLakeView: (lakeId) ->
    if not lakeId
      console.debug "Invalid lake id"
      return@

    console.debug "Rendering lake view"

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