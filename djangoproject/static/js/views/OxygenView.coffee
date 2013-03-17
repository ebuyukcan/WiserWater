window.WiserWater.OxygenView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('oxygen')
        return @

    events:
        "click #oxygenReady" : "onOxygenReady"

    render: ->
        $(@el).html @template
            title: "Measuring Dissolved Oxygen"
        return @

    onOxygenReady: ->
        showFeedback= ->
            $('#loadingContainer').hide()
            WiserWater.app.renderFeedback()
        console.debug "in oxygenReady"
        $('#oxygenInstructions').hide()
        $('#loadingContainer').show()
        setTimeout showFeedback, 3000
