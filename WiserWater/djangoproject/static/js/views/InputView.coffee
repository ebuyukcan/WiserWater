window.WiserWater.InputView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('input')
        return @

    #events:
    #    "click .close" : "onCloseView"

    render: ->
        $(@el).html @template()
        return @
    
    #onCloseView: (args) ->
    #    args.preventDefault()
    #    GroundUp.app.navigateMapView()