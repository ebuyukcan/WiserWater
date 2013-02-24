window.WiserWater.LakeItemView = Backbone.View.extend
    tagName: "li"; #tag of the generated element. If nothing will be div by default
    className: "lakeId"; # class of the generated element

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('lakeitem')
        console.debug options.model
        @lake = options.model
        return @

    render: ->
        console.debug @lake.toJSON()
        $(@el).html @template @lake.toJSON()
        return @
