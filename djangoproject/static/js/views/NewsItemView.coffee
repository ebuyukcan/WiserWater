window.WiserWater.NewsItemView = Backbone.View.extend
#    tagName: "li";
 #   className: "listId";

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('newsitem')
        @news = options.model
        return @

    render: ->
        $(@el).html @template @news.toJSON()
        return @