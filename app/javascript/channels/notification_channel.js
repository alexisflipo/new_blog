
import consumer from "./consumer";

const initNotificationCable = () => {
 consumer.subscriptions.create("NotificationChannel", {
  connected: function() {

    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {

    // Called when there's incoming data on the websocket for this channel
    $('#notifs').append("")
    $('#notifs').append(data)
    let items = ""
$.ajax({
    url: "/notifications.json",
    datatype: "JSON",
    method: "GET",
    success: (data) =>
    $.map(data, function(notification) {
      if (notification.count <= 1) {
      let items = ` ${notification.count} notification`
    $('#notifs-count').text(items)
      } else {
        let items = ` ${notification.count} notifications`
        $('#notifs-count').text(items)
      };
  })
   });
}
})
}
export { initNotificationCable };
