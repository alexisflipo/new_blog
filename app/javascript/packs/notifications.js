const notifications = () => {
(function() {
  ({
    constructor: function() {
      this.notifications = $("[data-behaviour='notifications']");
      if (this.notifications.length > 0) {
        this.setup();
      }
      return {
        setup: function() {
          return console.log('this.notifications');
        }
      };
    }
  });

}).call(this);
}
export { notifications };
