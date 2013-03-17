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
        cleanliness = "very_clean"
        console.debug "in onsubmitph"
        val = $(@el).find("input#phValue").val()
        phInput = new window.WiserWater.LakePhModel(
            userId: 11
            lakeId: 1
            value: val
        )
        console.log 'calling save()'
        phInput.save
            field1: 'test'
        ,
            wait: true
            success: (model, response) ->
                console.log 'response came'
                console.log response.responseText
                data = jQuery.parseJSON(response)
                cleanliness = data.result
                console.log 'success ' + cleanliness
            error: ->
                console.log "error"
        showFeedback= ->
            $('#loadingContainer').hide()
            console.log 'showfeedback' + cleanliness
            WiserWater.app.renderFeedback(cleanliness)
        $('#phInstructions').hide()
        $('#loadingContainer').show()
        setTimeout showFeedback, 3000