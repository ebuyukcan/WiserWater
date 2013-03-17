// Generated by CoffeeScript 1.4.0
var errorCallback, successCallback,
  _this = this;

window.WiserWater.HomeView = Backbone.View.extend({
  initialize: function(options) {
    this.template = _.template(WiserWater.tpl.get('home'));
    this.userLakes = new window.WiserWater.UserLakeCollection({
      userId: 11
    });
    this.userNews = new window.WiserWater.UserNewsCollection({
      userId: 11
    });
    this.allLakes = new window.WiserWater.LakeCollection();
    return this;
  },
  render: function() {
    var self, successHandler;
    self = this;
    this.el = $(this.template());
    this.userLakes.fetch({
      success: function(fetchedUserLakes) {
        self.userLakes = fetchedUserLakes;
        return self.renderUserLakes();
      }
    });
    this.userNews.fetch({
      success: function(fetchedNews) {
        self.userNews = fetchedNews;
        return self.renderUserNews();
      }
    });
    successHandler = function(position) {
      return this.successCallback(self, position);
    };
    navigator.geolocation.getCurrentPosition(successHandler, errorCallback);
    return this;
  },
  renderUserLakes: function() {
    _.each(this.userLakes.models, (function(item) {
      var lakeItemView;
      lakeItemView = new window.WiserWater.LakeItemView({
        model: item
      });
      return $("#pinnedLakes").append(lakeItemView.render().el);
    }), this);
    return $("#pinnedLakes").listview('refresh');
  },
  renderNearbyLakes: function(self, position) {
    _.each(self.nearbyLakes.models, (function(item, index) {
      var lakeItemView, latDelta, lonDelta;
      lonDelta = Math.abs(position.coords.longitude - item.getLocation().lon);
      latDelta = Math.abs(position.coords.latitude - item.getLocation().lat);
      if (lonDelta < 1 && latDelta < 1) {
        if (index === 7 || index === 8 || index === 9) {
          lakeItemView = new window.WiserWater.LakeItemView({
            model: item
          });
          return $("#nearbyLakes").append(lakeItemView.render().el);
        }
      }
    }), self);
    return $("#nearbyLakes").listview('refresh');
  },
  renderUserNews: function() {
    var item, newsItemView;
    item = this.userNews.models[0];
    newsItemView = new window.WiserWater.NewsItemView({
      model: item
    });
    return $("#newsStream").append(newsItemView.render().el);
  }
}, successCallback = function(self, position) {
  return self.allLakes.fetch({
    success: function(fetchedLakes) {
      self.nearbyLakes = fetchedLakes;
      return self.renderNearbyLakes(self, position);
    }
  });
}, errorCallback = function(error) {
  console.debug("in errorcallback");
  return console.debug(error);
});
