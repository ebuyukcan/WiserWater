window.WiserWater.FooterView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('footer')
        return @

    events:
        "click .homeButton" : "onHomeClick"
        "click .searchButton": "onSearchClick"
        "click .profileButton": "onProfileClick"

    render: ->
        $(@el).html @template()
        return @

     onHomeClick: (args) ->
        args.preventDefault()
        WiserWater.app.renderHome()

     onSearchClick: (args) ->
        args.preventDefault()
        WiserWater.app.renderSearchByMap()

     onProfileClick: (args) ->
        args.preventDefault()
        WiserWater.app.renderProfile()
