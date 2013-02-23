window.WiserWater.SearchByNameView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('searchname')
        return @

    render: ->
        $(@el).html @template()
        return @
