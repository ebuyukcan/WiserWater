window.WiserWater.LakeModel = Backbone.Model.extend
    initialize: (options) ->
        @id = options.lakeId
        @url = "/api/v1/project/" + encodeURIComponent(@id) + "/?format=json"

    getId: ->
    	return @id

    getName: ->
    	return @fetch "name"

    getRegion: ->
    	return @fetch "region"

    getLocationId: ->
    	return @fetch "locationId"

    getPollutionLevel: ->
    	return @fetch "pollutionLevel"