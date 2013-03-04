// Generated by CoffeeScript 1.3.3

window.WiserWater.NewsItemView = Backbone.View.extend({
  tagName: "li",
  className: "listId",
  initialize: function(options) {
    this.template = _.template(WiserWater.tpl.get('newsitem'));
    console.debug(options.model);
    this.news = options.model;
    return this;
  },
  render: function() {
    $(this.el).html(this.template());
    return this;
  }
});
