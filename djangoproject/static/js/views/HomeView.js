// Generated by CoffeeScript 1.4.0

window.WiserWater.HomeView = Backbone.View.extend({
  initialize: function(options) {
    this.template = _.template(WiserWater.tpl.get('home'));
    return this;
  },
  render: function() {
    $(this.el).html(this.template());
    return this;
  }
});
