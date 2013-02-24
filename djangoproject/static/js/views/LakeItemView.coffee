window.WiserWater.LakeItemView = Backbone.View.extend
    tagName: "li";
    className: "listId";

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('lakeitem')
        console.debug options.model
        @lake = options.model
        return @

    render: ->
        console.debug @lake.toJSON()
        $(@el).html @template @lake.toJSON()
        return @
