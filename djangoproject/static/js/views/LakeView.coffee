window.WiserWater.LakeView = Backbone.View.extend

    initialize: (options) ->
        console.debug "Initializing LakeView"
        @template = _.template WiserWater.tpl.get('lake')
        @lake = options
        return @

    render: ->
        $(@el).html @template @lake.toJSON()
        return @

