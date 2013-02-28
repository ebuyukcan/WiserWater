window.WiserWater.SearchByMapView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('searchmap')
#TODO change the url to get all lakes not just user lakes
        console.debug "Loading lakes"
        @allLakes = new window.WiserWater.LakeCollection()
        return @

    events:
       "click .searchName" : "onSearchNameClick"

    render: ->
      self = @
      $(@el).html @template()
      @allLakes.fetch
       success: (fetchedLakes) ->
              _.each self.allLakes.models, ((item) ->
                      lakePosition = new google.maps.LatLng(item.getLocation().lat, item.getLocation().lon)
                      $("#map_canvas").gmap "addMarker",
                      position: lakePosition 
                      bounds: true 
              ),@
      return @

    onSearchNameClick: (args) ->
        args.preventDefault()
        WiserWater.app.renderSearchByName()
