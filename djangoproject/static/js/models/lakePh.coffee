window.WiserWater.LakePhModel = Backbone.Model.extend(
  defaults:
    lakeId: 1
    userId: 2
    value: null

  url: ->
    "/api/v1/lakePh/?format=json"
)