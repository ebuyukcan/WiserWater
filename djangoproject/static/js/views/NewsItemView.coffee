window.WiserWater.NewsItemView = Backbone.View.extend
    tagName: "li";
    className: "listId";

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('newsItem')
        console.debug options.model
        @news = options.model
        return @

    render: ->
        console.debug @news.toJSON()
        $(@el).html @template @news.toJSON()
        return @
