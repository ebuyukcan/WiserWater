// Generated by CoffeeScript 1.3.3

window.WiserWater.SearchByMapView = Backbone.View.extend({
  initialize: function(options) {
    this.template = _.template(WiserWater.tpl.get('searchmap'));
    this.allLakes = new window.WiserWater.LakeCollection();
    return this;
  },
  events: {
    "click .searchName": "onSearchNameClick"
  },
  render: function() {
    var self;
    self = this;
    $(this.el).html(this.template());
    this.allLakes.fetch({
      success: function(fetchedLakes) {
        return _.each(self.allLakes.models, (function(item) {
          var lakePosition;
          lakePosition = new google.maps.LatLng(item.getLocation().lat, item.getLocation().lon);
          return $("#map_canvas").gmap("addMarker", {
            position: lakePosition,
            bounds: true
          });
        }), this);
      }
    });
    return this;
  },
  onSearchNameClick: function(args) {
    args.preventDefault();
    return WiserWater.app.renderSearchByName();
  }
});
