window.WiserWater.HomeView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('input')
        return @

    #events:
    #    "click .close" : "onCloseView"

    render: ->
        $(@el).html @template
            title: "Test your water"
        return @
    
    #onCloseView: (args) ->
    #    args.preventDefault()
    #    GroundUp.app.navigateMapView()