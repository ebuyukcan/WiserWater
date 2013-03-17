window.WiserWater.pHView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('ph')
        return @

    events:
        "click #submitpH": "onSubmitpH"

    render: ->
        $(@el).html @template
            title: "Measuring pH"
        return @

    onSubmitpH: ->
        showFeedback= ->
            $('#loadingContainer').hide()
            WiserWater.app.renderFeedback()
        console.debug "in onsubmitph"
        $('#phInstructions').hide()
        $('#loadingContainer').show()
        setTimeout showFeedback, 3000
