// Generated by CoffeeScript 1.3.3

window.WiserWater.NewsfeedView = Backbone.View.extend({
  initialize: function(options) {
    this.template = _.template(WiserWater.tpl.get('newsfeed'));
    return this;
  },
  render: function() {
    this.el = $(this.template());
    return this;
  }
});
