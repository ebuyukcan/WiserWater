// Generated by CoffeeScript 1.4.0

window.WiserWater.LakeView = Backbone.View.extend({
  initialize: function(options) {
    console.debug("Initializing LakeView");
    this.template = _.template(WiserWater.tpl.get('lake'));
    this.lake = options;
    return this;
  },
  render: function() {
    $(this.el).html(this.template(this.lake.toJSON()));
    return this;
  }
});
