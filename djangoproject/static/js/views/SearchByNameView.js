// Generated by CoffeeScript 1.3.3

window.WiserWater.SearchByNameView = Backbone.View.extend({
  initialize: function(options) {
    this.template = _.template(WiserWater.tpl.get('searchname'));
    return this;
  },
  render: function() {
    $(this.el).html(this.template);
    return this;
  }
});
