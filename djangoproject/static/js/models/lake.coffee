window.WiserWater.LakeModel = Backbone.Model.extend
    defaults:
        @distance = 0

    initialize: (options) ->
        @id = options.lakeId
        @url = "/api/v1/lake/" + encodeURIComponent(@id) + "/?format=json"

    getId: ->
        return @attributes["id"]

    getName: ->
        return @attributes["name"]

    getLocation: ->
        return {
            lat: @attributes["latitude"]
            lon: @attributes["longitude"]
        }

    getRegion: ->
        return @attributes["region"]

    getDistance: ->
        return @distance

window.WiserWater.LakeCollection = Backbone.Collection.extend
    model: WiserWater.LakeModel
    url: "/api/v1/lake/?format=json"

    
window.WiserWater.UserLakeCollection = Backbone.Collection.extend
    model: WiserWater.LakeModel

    initialize: (options) ->
        @url = "/api/v1/lake/byUser/?format=json&u=" + encodeURIComponent(options.userId)