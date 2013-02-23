window.WiserWater.HomeView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('home')
        return @

    #events:
    #    "click .close" : "onCloseView"

    render: ->
        $(@el).html @template
            title: "testsdfasd"
        return @
    
    #onCloseView: (args) ->
    #    args.preventDefault()
    #    GroundUp.app.navigateMapView()