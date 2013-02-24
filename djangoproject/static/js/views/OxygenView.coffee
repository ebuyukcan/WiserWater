window.WiserWater.OxygenView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('oxygen')
        return @

    #events:
        #"click .testAgain" : "onTestAgainClick"

    render: ->
        $(@el).html @template
          title: "Connect your oxygen sensor"
        return @

#    onTestAgainClick: (args) ->
      #args.preventDefault()
      #WiserWater.app.renderProfile()
          
