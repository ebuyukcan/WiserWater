window.WiserWater.SearchByNameView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('searchname')
        return @

    #events:
    #    "click .close" : "onCloseView"

    render: ->
        $(@el).html @template()
        return @
    
    #onCloseView: (args) ->
    #    args.preventDefault()
    #