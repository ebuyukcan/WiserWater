// Generated by CoffeeScript 1.4.0

window.WiserWater.FooterView = Backbone.View.extend({
  initialize: function(options) {
    this.template = _.template(WiserWater.tpl.get('footer'));
    return this;
  },
  events: {
    "click .homeButton": "onHomeClick",
    "click .searchButton": "onSearchClick",
    "click .profileButton": "onProfileClick"
  },
  render: function() {
    $(this.el).html(this.template());
    return this;
  },
  onHomeClick: function(args) {
    args.preventDefault();
    return WiserWater.app.renderHome();
  },
  onSearchClick: function(args) {
    args.preventDefault();
    return WiserWater.app.renderSearchByMap();
  },
  onProfileClick: function(args) {
    args.preventDefault();
    return WiserWater.app.renderProfile();
  }
});
