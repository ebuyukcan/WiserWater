window.WiserWater.SearchByMapView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('searchmap')
        return @

    events:
       "click .searchName" : "onSearchNameClick"

    render: ->
        $(@el).html @template
        return @


    onSearchNameClick: (args) ->
        args.preventDefault()
        WiserWater.app.renderSearchByName()