window.WiserWater.SearchByNameView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('searchname')
        return @

	    events:
	       "click .searchMap" : "onSearchMapClick"

	    render: ->
	        @el = $(@template())
	        return @


	    onSearchMapClick: (args) ->
	        args.preventDefault()
	        WiserWater.app.renderSearchByMap()