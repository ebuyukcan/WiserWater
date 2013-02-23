window.WiserWater.CameraView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('camera')
        return @

    # events:
    #    "click #cameraButton" : "onCameraPressed"

    render: ->
        $(@el).html @template
            title: "Take a photo of your water"
        return @