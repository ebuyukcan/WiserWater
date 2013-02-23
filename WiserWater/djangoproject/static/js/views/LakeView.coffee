window.WiserWater.LakeView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('lake')
        return @

<<<<<<< HEAD
    render: ->
        $(@el).html @template()
        return @
=======
    #events:
    #    "click .close" : "onCloseView"

    render: ->
        $(@el).html @template()
        return @
    
    #onCloseView: (args) ->
    #    args.preventDefault()
    #    GroundUp.app.navigateMapView()
>>>>>>> Added all the routes in AppRouter. main loads all templates. All Views created and rendering from AppRoute
