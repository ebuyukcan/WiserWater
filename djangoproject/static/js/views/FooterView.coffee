window.WiserWater.FooterView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('footer')
        return @

    render: ->
        $(@el).html @template()
        return @