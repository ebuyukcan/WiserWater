window.WiserWater.NewsfeedView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('newsfeed')
        return @

    render: ->
        @el = $(@template())
        return @
