window.WiserWater.FeedbackView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('feedback')
        return @

    events:
        "click .goToLake" : "onLakeClick"
        "click .testAgain" : "onTestAgainClick"

    render: ->
        $(@el).html @template
            title: "Measurement results"
        $(@el).onload = @detachCamera
        return @

    detachCamera: ->
        $("#snap").unbind "click"

    onLakeClick: (args) ->
        args.preventDefault()
        WiserWater.app.renderLake()

    onTestAgainClick: (args) ->
        args.preventDefault()
        WiserWater.app.renderInput()