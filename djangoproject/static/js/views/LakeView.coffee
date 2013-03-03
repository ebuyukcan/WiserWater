window.WiserWater.LakeView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('lake')
        return @


    render: ->
        @el = $(@template())
        return @

