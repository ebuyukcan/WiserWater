window.WiserWater.CameraView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('camera')
        return @

    events:
        "click #instructionOK" : "onInstructionClickOK"

    render: ->
        $(@el).html @template
            title: "Take a photo of your water"
        return @

    snapPhoto: ->
        # Put event listeners into place
        canvas = document.getElementById("canvas")
        context = canvas.getContext("2d")
        video = document.getElementById("video")
        videoObj = video: true
        errBack = (error) ->
            console.log "Video capture error: ", error.code

        if navigator.getUserMedia
            navigator.getUserMedia videoObj, ((stream) ->
                video.src = stream
                video.play()
            ), errBack
        else if navigator.webkitGetUserMedia # WebKit-prefixed
            navigator.webkitGetUserMedia videoObj, ((stream) ->
                video.src = window.webkitURL.createObjectURL(stream)
                video.play()
            ), errBack
        show = ->
            $('#camera').hide()
            $('#loadingContainer').show()
            setTimeout hide, 3000

        hide = ->
            $('#loadingContainer').hide()
            console.debug "rendering feedback??"
            WiserWater.app.renderFeedback()
    
    # Trigger photo take
        document.getElementById("snap").addEventListener "click", ->
            context.drawImage video, 0, 0, 640, 480
            console.debug "setting timeout"
            show()
            console.debug "showed loading"

    onInstructionClickOK: ->
        $('#photoInstructions').hide()
        $('#camera').show()
        @snapPhoto()