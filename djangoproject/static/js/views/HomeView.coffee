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
      navigator.geolocation.getCurrentPosition successCallback, errorCallback
      @allLakes.fetch
          success: (fetchedLakes) ->
              self.nearbyLakes = fetchedLakes
              self.renderNearbyLakes()
      return @

     renderUserLakes: ->
      _.each @userLakes.models, ((item) ->
            lakeItemView = new window.WiserWater.LakeItemView(model: item)
            $("#pinnedLakes").append lakeItemView.render().el
      ), @
      $("#pinnedLakes").listview('refresh')

    renderNearbyLakes: ->
        console.debug "rendering nearby lakes"
# I suppose this didnt get here because it is still getting the position at this point of the execution
# For now we will be using static position and filter based on that
        console.debug @currentPositionLongitude
#LON 24.83643 
#LAT 60.1910714
        _.each @nearbyLakes.models, ((item) ->
          console.debug item.getLocation().lon
          console.debug item.getLocation().lat
          if (item.getLocation().lon > 23 and item.getLocation().lon < 25) and (item.getLocation().lat > 60 and item.getLocation().lat < 61)
            console.debug "IN"
            lakeItemView = new window.WiserWater.LakeItemView(model: item)
            $("#nearbyLakes").append lakeItemView.render().el
        ), @
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

    successCallback = (position) =>
      console.debug "in successCallback"
      console.debug position
      @currentPositionLon = position.coords.longitude
      @currentPositionLat = position.coords.latitude
      console.debug @currentPositionLon
      console.debug @currentPositionLat

    errorCallback = (error) ->
      console.debug "in errorcallback"
      console.debug error