window.WiserWater.InputView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('input')
        return @

    events:
        "click #cameraButton" : "onCameraPressed"
        "click #phButton" : "onPhPressed"
        "click #oxygenButton" : "onOxygenPressed"

    render: ->
        @$el.html @template     
        # it is the same as the line below
        #$(@el).html @template
            title: "Test your water"
        return @
    
    onCameraPressed: (args) ->
        args.preventDefault()
        WiserWater.app.renderCamera()
		
    onPhPressed: (args) ->
        args.preventDefault()
        WiserWater.app.renderPh()
		
    onOxygenPressed: (args) ->
        args.preventDefault()
        WiserWater.app.renderOxygen()
