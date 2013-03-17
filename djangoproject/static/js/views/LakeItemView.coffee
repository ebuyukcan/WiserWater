window.WiserWater.LakeItemView = Backbone.View.extend
    tagName: "li"; #tag of the generated element. If nothing will be div by default
    className: "lakeId"; # class of the generated element

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('lakeitem')
        @lake = options.model
        return @

    events: ->
        "click" : "onClickLoadLakePage"

    render: ->
        $(@el).html @template @lake.toJSON()
        return @

    onClickLoadLakePage: (args) ->
      args.preventDefault()
      WiserWater.app.renderLake(@lake)
