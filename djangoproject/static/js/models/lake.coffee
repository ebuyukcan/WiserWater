window.WiserWater.LakeModel = Backbone.Model.extend
    initialize: (options) ->
#listeners for changes to the model goes here   
        @id = options.lakeId
        @url = "/api/v1/project/" + encodeURIComponent(@id) + "/?format=json"
        console.log "Lake model has been initialized."

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
