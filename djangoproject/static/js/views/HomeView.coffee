window.WiserWater.HomeView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('home')
        @userLakes = new window.WiserWater.UserLakeCollection({userId:11})
        return @

    events:
        "click .lakeId" : "onLakeClick"

    render: ->
      self = @
      $(@el).html @template()	
      @userLakes.fetch
          success: (fetchedLakes) ->
              console.debug "success!!"
              self.userLakes = fetchedLakes
              self.renderUserLakes()
      return @

    renderUserLakes: ->
      _.each @userLakes.models, ((item) ->
            lakeItemView = new window.WiserWater.LakeItemView(model: item)
            $("#pinnedLakes").append lakeItemView.render().el
      ), @
      $("#pinnedLakes").listview('refresh')

    onLakeClick: (args) ->
      console.debug "clicked on a lake"
      args.preventDefault()
      console.debug args
      WiserWater.app.renderLake()