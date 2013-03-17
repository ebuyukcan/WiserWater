window.WiserWater.FeedbackView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('feedback')
        @cleanliness = options.cleanliness
        return @

    events:
        "click .goToLake" : "onLakeClick"
        "click .testAgain" : "onTestAgainClick"

    render: ->
        $(@el).html @template
            title: "Measurement results"
        console.log 'feedback.coffee ' + @cleanliness
        if @cleanliness is "very_clean"
            $("#veryCleanImg").show
            $("#cleanlinessText").text 'very clean'
        else if @cleanliness is "dirty"
            $("#dirtyImg").show
            $("#cleanlinessText").text 'dirty'
        else if @cleanliness is "very_dirty"
            $("#veryDirtyImg").show
            console.log $("#cleanlinessText").text()
            $("#cleanlinessText").text 'very dirty'
            console.log 'veryDirtyImg' + $("#cleanlinessText").text()
        else
            $("#cleanImg").show
            $("#cleanlinessText").text 'clean'
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