window.WiserWater.NewsModel = Backbone.Model.extend
    initialize: (options) ->
        @id = options.newsId
        @url = "/api/v1/news/" + encodeURIComponent(@id) + "/?format=json"

    getId: ->
        return @id

    getContent: ->
        return @attributes["content"]

    getUser: ->
        return @attributes["user"]

window.WiserWater.NewsCollection = Backbone.Collection.extend
    model: WiserWater.NewsModel
    url: "/api/v1/news/?format=json"

    
window.WiserWater.UserNewsCollection = Backbone.Collection.extend
    model: WiserWater.NewsModel

    initialize: (options) ->
        @url = "/api/v1/news/latest/?format=json&u=" + encodeURIComponent(options.userId)