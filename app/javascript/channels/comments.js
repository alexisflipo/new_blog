import consumer from "./consumer";

const initCommentCable = () => {
  consumer.subscriptions.create("CommentsChannel", {
  connected: function() {

    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    $("#messages").append(data);

  }
});
}

export { initCommentCable };
