window.WiserWater.ProfileView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('profile')
        @userLakes = new window.WiserWater.UserLakeCollection({userId:11})
        @userNews = new window.WiserWater.UserNewsCollection({userId:11})
        return @

    events:
        "click .lakeId" : "onLakeClick"

    onLakeClick: (args) ->
      args.preventDefault()
      WiserWater.app.renderLake()
    
    render: ->
      self = @
      @el = $(@template())	
      @userLakes.fetch
          success: (fetchedUserLakes) ->
              self.userLakes = fetchedUserLakes
              self.renderUserLakes()
      @userNews.fetch
          success: (fetchedNews) ->
              self.userNews = fetchedNews
              self.renderUserNews()
      return @

     renderUserLakes: ->
      _.each @userLakes.models, ((item) ->
            lakeItemView = new window.WiserWater.LakeItemView(model: item)
            $("#pinnedLakes").append lakeItemView.render().el
      ), @
      $("#pinnedLakes").listview('refresh')


    renderUserNews: ->
      _.each @userNews.models, ((item) ->
          newsItemView = new window.WiserWater.NewsItemView(model: item)
          $("#newsStream").append newsItemView.render().el
      ), @
  #    $("#newsStream").listview('refresh')
