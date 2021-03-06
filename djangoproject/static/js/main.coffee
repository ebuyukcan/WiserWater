WiserWater = {}
WiserWater.app = undefined
WiserWater.tpl = new Templates()

Backbone.View::navigateAnchor = (event) ->
    event.preventDefault()
    WiserWater.app.navigate(event.currentTarget.getAttribute("href"), {trigger: true})

Backbone.View::back = (event) ->
    WiserWater.app.route.removeAllFeatures()
    event.preventDefault()
    if @transition
        WiserWater.app.transition = @transition
    else
        WiserWater.app.transition = "slide"
    WiserWater.app.historyBack = true
    window.history.back()

# Entry point of the app
WiserWater.tpl.loadTemplates(
    [ "home", "footer", "header", "input", "lake", "lakeitem", "newsitem", "profile", "searchmap", "searchname", "feedback", "camera", "oxygen", "ph" ],
    () ->
        WiserWater.app = new AppRouter()
        Backbone.history.start()
    )
