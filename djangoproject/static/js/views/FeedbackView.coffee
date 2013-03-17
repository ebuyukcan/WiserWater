window.WiserWater.FeedbackView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('feedback')
        @cleanliness = options.cleanliness
        return @

    events:
        "click .goToLake" : "onLakeClick"
        "click .testAgain" : "onTestAgainClick"

    render: ->
        dom = $(@template(title: "Measurement results"))
        if @cleanliness is "very_clean"
            dom.find("#veryCleanImg").css "display", "inline"
            dom.find("#cleanlinessText").text "very clean"
        else if @cleanliness is "dirty"
            dom.find("#dirtyImg").css "display", "inline"
            dom.find("#cleanlinessText").text "dirty"
        else if @cleanliness is "very_dirty"
            dom.find("#veryDirtyImg").css 'display', 'inline'
            dom.find("#cleanlinessText").text "very dirty"
        else
            dom.find("#cleanImg").css "display", "inline"
            dom.find("#cleanlinessText").text "clean"
        $(@el).html dom.html()
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