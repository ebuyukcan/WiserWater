window.WiserWater.FeedbackView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('feedback')
        return @

    render: ->
        $(@el).html @template
            title: "Measurement results"
        $(@el).onload = @detachCamera
        return @
		
    detachCamera: ->
        $("#snap").unbind "click"