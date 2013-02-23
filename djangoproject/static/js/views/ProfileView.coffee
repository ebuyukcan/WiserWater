window.WiserWater.ProfileView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('profile')
        return @

    render: ->
        $(@el).html @template
        return @
    