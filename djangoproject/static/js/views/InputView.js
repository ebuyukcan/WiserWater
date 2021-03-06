// Generated by CoffeeScript 1.4.0

window.WiserWater.InputView = Backbone.View.extend({
  initialize: function(options) {
    this.template = _.template(WiserWater.tpl.get('input'));
    return this;
  },
  events: {
    "click #cameraButton": "onCameraPressed",
    "click #phButton": "onPhPressed",
    "click #oxygenButton": "onOxygenPressed"
  },
  render: function() {
    this.$el.html(this.template({
      title: "Test your water"
    }));
    return this;
  },
  onCameraPressed: function(args) {
    args.preventDefault();
    return WiserWater.app.renderCamera();
  },
  onPhPressed: function(args) {
    args.preventDefault();
    return WiserWater.app.renderPh();
  },
  onOxygenPressed: function(args) {
    args.preventDefault();
    return WiserWater.app.renderOxygen();
  }
});
