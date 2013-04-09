// Generated by CoffeeScript 1.4.0
var distHaversine, errorCallback, rad, successCallback,
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
        console.debug(self.userNews);
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
      var distance, itemLat, itemLon, lakeItemView, lat, latDelta, lon, lonDelta;
      lon = position.coords.longitude;
      lat = position.coords.latitude;
      itemLon = item.getLocation().lon;
      itemLat = item.getLocation().lat;
      lonDelta = Math.abs(lon - itemLon);
      latDelta = Math.abs(lat - itemLat);
      if (lonDelta < 1 && latDelta < 1) {
        if (index === 7 || index === 8 || index === 9) {
          distance = distHaversine(lon, lat, itemLon, itemLat);
          item.set("distance", distance);
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
    return _.each(this.userNews.models, (function(item) {
      var newsItemView;
      newsItemView = new window.WiserWater.NewsItemView({
        model: item
      });
      return $("#newsStream").append(newsItemView.render().el);
    }), this);
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
}, rad = function(x) {
  return x * Math.PI / 180;
}, distHaversine = function(p1Lon, p1Lat, p2Lon, p2Lat) {
  var R, a, c, d, dLat, dLong;
  R = 6371;
  dLat = rad(p2Lat - p1Lat);
  dLong = rad(p2Lon - p1Lon);
  a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.cos(rad(p1Lat)) * Math.cos(rad(p2Lat)) * Math.sin(dLong / 2) * Math.sin(dLong / 2);
  c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  d = R * c;
  return d.toFixed(0);
});
