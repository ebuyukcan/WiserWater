window.WiserWater.SearchByNameView = Backbone.View.extend

    initialize: (options) ->
        @template = _.template WiserWater.tpl.get('searchname')
        @allLakes = new window.WiserWater.LakeCollection()
        return @

    events:
        "click .searchMap" : "onSearchMapClick"

    render: ->
      self = @
      $(@el).html @template()
      @allLakes.fetch
       success: (fetchedLakes) ->
              _.each self.allLakes.models, ((item) ->
                      $("#lakeList").append "<li class=\"lakeId\" id=\"lake" + item.getId() + "\">" + item.getName() + "</li>"
                      $("#lake" + item.getId() + "").click ->
                        WiserWater.app.renderLake item
              ),@
      return @

    onSearchMapClick: (args) ->
            args.preventDefault()
            WiserWater.app.renderSearchByMap()


