window.WiserWater.ProfileView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('profile')
        return @

    #events:
    #    "click .close" : "onCloseView"

    render: ->
        $(@el).html @template()
        return @
    
    #onCloseView: (args) ->
    #    args.preventDefault()
    #