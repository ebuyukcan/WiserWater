// Generated by CoffeeScript 1.4.0
var WiserWater;

WiserWater = {};

WiserWater.app = void 0;

WiserWater.tpl = new Templates();

Backbone.View.prototype.navigateAnchor = function(event) {
  event.preventDefault();
  return WiserWater.app.navigate(event.currentTarget.getAttribute("href"), {
    trigger: true
  });
};

Backbone.View.prototype.back = function(event) {
  WiserWater.app.route.removeAllFeatures();
  event.preventDefault();
  if (this.transition) {
    WiserWater.app.transition = this.transition;
  } else {
    WiserWater.app.transition = "slide";
  }
  WiserWater.app.historyBack = true;
  return window.history.back();
};

WiserWater.tpl.loadTemplates(["home", "footer", "header", "input", "lake", "profile", "searchmap", "searchname", "feedback", "camera", "oxygen", "newsfeed"], function() {
  WiserWater.app = new AppRouter();
  return Backbone.history.start();
});
