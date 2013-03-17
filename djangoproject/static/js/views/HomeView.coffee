window.WiserWater.HomeView = Backbone.View.extend
  	
    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('home')
        @userLakes = new window.WiserWater.UserLakeCollection({userId:11})
        @userNews = new window.WiserWater.UserNewsCollection({userId:11})
        @allLakes = new window.WiserWater.LakeCollection()
        return @

    render: ->
      self = @
      @el = $(@template())
      # @$el.html @template 
      # it is the same as the line below
      # $(@el).html @template()	
      @userLakes.fetch
          success: (fetchedUserLakes) ->
              self.userLakes = fetchedUserLakes
              self.renderUserLakes()
      @userNews.fetch
          success: (fetchedNews) ->
              self.userNews = fetchedNews
              console.debug self.userNews
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
        _.each self.nearbyLakes.models, ((item,index) ->
          lon = position.coords.longitude 
          lat = position.coords.latitude
          itemLon = item.getLocation().lon
          itemLat = item.getLocation().lat
          lonDelta = Math.abs(lon - itemLon)
          latDelta = Math.abs(lat - itemLat)
          if(lonDelta < 1 and latDelta < 1)
              if (index is 7 or index is 8 or index is 9)
                distance = distHaversine(lon,lat, itemLon,itemLat)
                item.set "distance", distance
                lakeItemView = new window.WiserWater.LakeItemView(model: item)
                $("#nearbyLakes").append lakeItemView.render().el
        ), self
        $("#nearbyLakes").listview('refresh')

    renderUserNews: ->
      _.each @userNews.models, ((item) ->
          newsItemView = new window.WiserWater.NewsItemView(model: item)
          $("#newsStream").append newsItemView.render().el
      ), @
  #    $("#newsStream").listview('refresh')

    successCallback = (self,position) =>
       self.allLakes.fetch
          success: (fetchedLakes) ->
              self.nearbyLakes = fetchedLakes
              self.renderNearbyLakes(self,position)
      
    errorCallback = (error) ->
      console.debug "in errorcallback"
      console.debug error

    rad = (x) ->
      x * Math.PI / 180

    distHaversine = (p1Lon, p1Lat, p2Lon, p2Lat) ->
      R = 6371 # earth's mean radius in km
      dLat = rad(p2Lat - p1Lat)
      dLong = rad(p2Lon - p1Lon)
      a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.cos(rad(p1Lat)) * Math.cos(rad(p2Lat)) * Math.sin(dLong / 2) * Math.sin(dLong / 2)
      c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
      d = R * c
      d.toFixed 0