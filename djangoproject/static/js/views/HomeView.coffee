window.WiserWater.HomeView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('home')
        @userLakes = new window.WiserWater.UserLakeCollection({userId:11})
        @userNews = new window.WiserWater.UserNewsCollection({userId:11})
        return @

    events:
        "click .lakeId" : "onLakeClick"

    render: ->
      self = @
      $(@el).html @template()	
      @userLakes.fetch
          success: (fetchedLakes) ->
              self.userLakes = fetchedLakes
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
      item = @userNews.models[0]
      newsItemView = new window.WiserWater.NewsItemView(model: item)
      $("#newsStream").append newsItemView.render().el

    onLakeClick: (args) ->
      console.debug "clicked on a lake"
      args.preventDefault()
      console.debug args
      WiserWater.app.renderLake()
