window.WiserWater.CameraView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('camera')
        return @

    render: ->
        $(@el).html @template
            title: "Take a photo of your water"
        $(@el).onload = @snapPhoto
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
    
    # Trigger photo take
        document.getElementById("snap").addEventListener "click", ->
            context.drawImage video, 0, 0, 640, 480
            console.debug "gonna render feedback"
            WiserWater.app.renderFeedback()