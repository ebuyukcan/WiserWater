// Generated by CoffeeScript 1.4.0

window.WiserWater.LakePhModel = Backbone.Model.extend({
  defaults: {
    lakeId: 1,
    userId: 2,
    value: null
  },
  url: function() {
    return "/api/v1/lakePh/?format=json";
  }
});
