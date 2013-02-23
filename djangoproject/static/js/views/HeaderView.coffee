window.WiserWater.HeaderView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('header')
        return @

    render: ->
        $(@el).html @template()
        return @