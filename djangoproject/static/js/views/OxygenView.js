// Generated by CoffeeScript 1.3.3

window.WiserWater.OxygenView = Backbone.View.extend({
  initialize: function(options) {
    this.template = _.template(WiserWater.tpl.get('oxygen'));
    return this;
  },
  render: function() {
    $(this.el).html(this.template({
      title: "Connect your oxygen sensor"
    }));
    return this;
  }
});