window.WiserWater.OxygenView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('oxygen')
        return @

    render: ->
        $(@el).html @template
          title: "Connect your oxygen sensor"
        return @
