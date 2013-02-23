window.WiserWater.FooterView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('footer')
        return @

    events:
        "click .homeButton" : "onHomeClick"

    render: ->
        $(@el).html @template()
        return @

     onHomeClick: (args) ->
        args.preventDefault()
        WiserWater.app.renderHome()

     onSearchClick: (args) ->
        args.preventDefault()
        WiserWater.app.renderSearch()

     onProfileClick: (args) ->
        args.preventDefault()
        WiserWater.app.renderProfile()