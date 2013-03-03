window.WiserWater.ProfileView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('profile')
        return @

    render: ->
        @el = $(@template())
        return @

    events:
        "click .lakeId" : "onLakeClick"

    onLakeClick: (args) ->
      args.preventDefault()
      WiserWater.app.renderLake()
    
