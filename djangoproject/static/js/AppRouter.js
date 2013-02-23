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
    "input": "renderInput",
    "lake": "renderLake"
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
    this.setPage($("#content"), new WiserWater.LakeView());
    console.debug("Invalid lake id");
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
