window.WiserWater.HomeView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('home')
        return @

    events:
        "click .lakeId" : "onLakeClick"

    render: ->
        $(@el).html @template()
        return @

    onLakeClick: (args) ->
      args.preventDefault()
      WiserWater.app.renderLake()

    
    #onCloseView: (args) ->
    #    args.preventDefault()
    #    GroundUp.app.navigateMapView()

	TodosCollection = new Backbone.Collection()
	TodosCollection.add [
	  title: "go to Belgium."
	  completed: false
	,
	  title: "go to China."
	  completed: false
	,
	  title: "go to Austria."
	  completed: true
	]

	# iterate over models in the collection
	TodosCollection.forEach (model) ->
	  console.log model.get("title")


	# Above logs:
	# go to Belgium.
	# go to China.
	# go to Austria.

	# sort collection
	sortedByAlphabet = TodosCollection.sortBy((todo) ->
	  todo.get("title").toLowerCase()
	)
	console.log "- Now sorted: "
	sortedByAlphabet.forEach (model) ->
	  console.log model.get("title")


	# Above logs:
	# go to Austria.
	# go to Belgium.
	# go to China.