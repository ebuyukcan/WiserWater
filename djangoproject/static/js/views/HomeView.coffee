window.WiserWater.HomeView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('home')
        @userLakes = new window.WiserWater.UserLakeCollection({userId:11})
        @userNews = new window.WiserWater.UserNewsCollection({userId:11})
        @allLakes = new window.WiserWater.LakeCollection()
        return @

    events:
        "click .lakeId" : "onLakeClick"

    render: ->
      self = @
      $(@el).html @template()	
      @userLakes.fetch
          success: (fetchedUserLakes) ->
              self.userLakes = fetchedUserLakes
              self.renderUserLakes()
      @userNews.fetch
          success: (fetchedNews) ->
              self.userNews = fetchedNews
              self.renderUserNews()
      successHandler = (position) -> @successCallback(self, position)
      navigator.geolocation.getCurrentPosition successHandler, errorCallback
      
      return @

     renderUserLakes: ->
      _.each @userLakes.models, ((item) ->
            lakeItemView = new window.WiserWater.LakeItemView(model: item)
            $("#pinnedLakes").append lakeItemView.render().el
      ), @
      $("#pinnedLakes").listview('refresh')

    renderNearbyLakes: (self, position) ->
        _.each self.nearbyLakes.models, ((item) ->
            lonDelta = Math.abs(position.coords.longitude - item.getLocation().lon)
            latDelta = Math.abs(position.coords.latitude - item.getLocation().lat)
            if (lonDelta < 1 and latDelta < 1)
              console.debug "IN"
              lakeItemView = new window.WiserWater.LakeItemView(model: item)
              $("#nearbyLakes").append lakeItemView.render().el
        ), self
        $("#nearbyLakes").listview('refresh')

    renderUserNews: ->
      item = @userNews.models[0]
      newsItemView = new window.WiserWater.NewsItemView(model: item)
      $("#newsStream").append newsItemView.render().el

    onLakeClick: (args) ->
      console.debug "clicked on a lake"
      args.preventDefault()
      console.debug args
      WiserWater.app.renderLake()

    successCallback = (self,position) =>
      console.debug "in successCallback"
      console.debug position
      console.debug self
      self.allLakes.fetch
          success: (fetchedLakes) ->
              self.nearbyLakes = fetchedLakes
              self.renderNearbyLakes(self,position)
      
    errorCallback = (error) ->
      console.debug "in errorcallback"
      console.debug error