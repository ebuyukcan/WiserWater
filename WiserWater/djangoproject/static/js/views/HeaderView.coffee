window.WiserWater.HeaderView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('header')
        return @

    events:
        "click .homeButton" : "onHomeClick"
        "click .inputButton" : "onInputClick"
        "click .navigateButton" : "onNavigateClick"

    render: ->
        $(@el).html @template()
        return @

     onHomeClick: (args) ->
        args.preventDefault()
        WiserWater.app.renderHome()

     onInputClick: (args) ->
        args.preventDefault()
        WiserWater.app.renderInput()

     onNavigateClick: (args) ->
        args.preventDefault()
        WiserWater.app.renderNavigate()