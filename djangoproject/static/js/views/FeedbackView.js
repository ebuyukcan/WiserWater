// Generated by CoffeeScript 1.4.0

window.WiserWater.FeedbackView = Backbone.View.extend({
  initialize: function(options) {
    this.template = _.template(WiserWater.tpl.get('feedback'));
    this.cleanliness = options.cleanliness;
    return this;
  },
  events: {
    "click .goToLake": "onLakeClick",
    "click .testAgain": "onTestAgainClick"
  },
  render: function() {
    var dom;
    dom = $(this.template({
      title: "Measurement results"
    }));
    if (this.cleanliness === "very_clean") {
      dom.find("#veryCleanImg").css("display", "inline");
      dom.find("#cleanlinessText").text("very clean");
    } else if (this.cleanliness === "dirty") {
      dom.find("#dirtyImg").css("display", "inline");
      dom.find("#cleanlinessText").text("dirty");
    } else if (this.cleanliness === "very_dirty") {
      dom.find("#veryDirtyImg").css('display', 'inline');
      dom.find("#cleanlinessText").text("very dirty");
    } else {
      dom.find("#cleanImg").css("display", "inline");
      dom.find("#cleanlinessText").text("clean");
    }
    $(this.el).html(dom.html());
    $(this.el).onload = this.detachCamera;
    return this;
  },
  detachCamera: function() {
    return $("#snap").unbind("click");
  },
  onLakeClick: function(args) {
    args.preventDefault();
    return WiserWater.app.renderLake();
  },
  onTestAgainClick: function(args) {
    args.preventDefault();
    return WiserWater.app.renderInput();
  }
});
