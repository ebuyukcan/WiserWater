// Generated by CoffeeScript 1.4.0

window.WiserWater.SearchByMapView = Backbone.View.extend({
  initialize: function(options) {
    this.template = _.template(WiserWater.tpl.get('searchmap'));
    return this;
  },
  events: {
    "click .searchName": "onSearchNameClick"
  },
  render: function() {
    $(this.el).html(this.template);
    return this;
  },
  onSearchNameClick: function(args) {
    args.preventDefault();
    return WiserWater.app.renderSearchByName();
  }
});
