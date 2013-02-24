window.WiserWater.HomeView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('home')
        return @

    events:
        "click .lakeId" : "onLakeClick"

    render: ->
        $(@el).html @template()
        return @

    onLakeClick: (args) ->
      args.preventDefault()
      WiserWater.app.renderLake()

