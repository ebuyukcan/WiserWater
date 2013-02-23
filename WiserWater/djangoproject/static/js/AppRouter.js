// Generated by CoffeeScript 1.3.3
var AppRouter;

AppRouter = Backbone.Router.extend({
  initialize: function() {
    this.historyBack = false;
    this.pages = {};
    return console.debug("Initialized AppRouter");
  },
  routes: {
    "": "renderHome",
    "input": "renderInput",
    "lake": "renderLake",
    "profile": "renderProfile",
    "searchmap": "renderSearchByMap",
    "searchname": "renderSearchByName"
  },
  renderHome: function() {
    console.debug("Rendering home");
    this.setPage($("#content"), new WiserWater.HomeView());
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
  renderLake: function(lakeId) {
    console.debug("Rendering lake view");
    this.setPage($("#content"), new WiserWater.LakeView());
    console.debug("Invalid lake id");
    return this;
  },
  renderProfile: function() {
    console.debug("Rendering profile");
    this.setPage($("#content"), new WiserWater.ProfileView());
    return this;
  },
  renderSearchByMap: function() {
    console.debug("Rendering SearchByMap");
    this.setPage($("#content"), new WiserWater.SearchByMapView());
    return this;
  },
  renderSearchByName: function() {
    console.debug("Rendering SearchByName");
    this.setPage($("#content"), new WiserWater.SearchByNameView());
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
