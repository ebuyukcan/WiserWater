// Generated by CoffeeScript 1.3.3

window.WiserWater.SearchByNameView = Backbone.View.extend({
  initialize: function(options) {
    this.template = _.template(WiserWater.tpl.get('searchname'));
    return this;
  },
  events: {
    "click .searchMap": "onSearchMapClick"
  },
  render: function() {
    this.el = $(this.template());
    return this;
  },
  onSearchMapClick: function(args) {
    args.preventDefault();
    return WiserWater.app.renderSearchByMap();
  }
});
