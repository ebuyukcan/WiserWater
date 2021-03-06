// Generated by CoffeeScript 1.4.0
var AppRouter;

AppRouter = Backbone.Router.extend({
  initialize: function() {
    this.historyBack = false;
    this.pages = {};
    return console.debug("Initialized AppRouter");
  },
  routes: {
    "": "renderHome",
    "/input": "renderInput",
    "/lake": "renderLake",
    "/profile": "renderProfile",
    "/searchmap": "renderSearchByMap",
    "/searchname": "renderSearchByName",
    "*other": "defaultRoute"
  },
  defaultRoute: function(other) {
    return console.log("Invalid. You attempted to reach:" + other);
  },
  renderHome: function() {
    console.debug("Rendering home");
    this.setPage($("#content"), new WiserWater.HomeView({
      el: $("#content")
    }));
    return this;
  },
  renderInput: function() {
    console.debug("Rendering input");
    this.setPage($("#content"), new WiserWater.InputView());
    return this;
  },
  renderNavigate: function() {
    return console.debug("Rendering navigate");
  },
  renderLake: function(item) {
    this.setPage($("#content"), new WiserWater.LakeView(item));
    return this;
  },
  renderProfile: function() {
    console.debug("Rendering profile");
    this.setPage($("#content"), new WiserWater.ProfileView());
    return this;
  },
  renderSearchByMap: function() {
    console.debug("Rendering search by map");
    this.setPage($("#content"), new WiserWater.SearchByMapView());
    return this;
  },
  renderSearchByName: function() {
    console.debug("Rendering search by name");
    this.setPage($("#content"), new WiserWater.SearchByNameView());
    return this;
  },
  renderCamera: function() {
    var view;
    view = new WiserWater.CameraView();
    this.setPage($("#content"), view);
    view.snapPhoto();
    return this;
  },
  renderFeedback: function(cleanliness) {
    console.debug("Rendering feedback" + cleanliness);
    this.setPage($("#content"), new WiserWater.FeedbackView({
      cleanliness: cleanliness
    }));
    return this;
  },
  renderOxygen: function() {
    console.debug("Rendering oxygen");
    this.setPage($("#content"), new WiserWater.OxygenView());
    return this;
  },
  renderPh: function() {
    console.debug("Rendering pH");
    this.setPage($("#content"), new WiserWater.pHView());
    return this;
  },
  setPage: function(target, view, header, footer) {
    if (header == null) {
      header = new WiserWater.HeaderView();
    }
    if (footer == null) {
      footer = new WiserWater.FooterView();
    }
    $("#header").html(header.render().el).trigger("create");
    $("#footer").html(footer.render().el).trigger("create");
    if (view != null) {
      target.html($(view.render().el));
      return target.trigger("create");
    }
  },
  changePageJQM: function(page) {
    $(page.el).attr('data-role', 'page');
    page.render;
    $('body').append($(page.el));
    return $.mobile.changePage($(page.el), {
      changeHash: false
    });
  }
});
