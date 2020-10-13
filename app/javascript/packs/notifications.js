const notifications = () => {
 let items;
  let notifs = $("[data-behaviour='notifications']");
  if (notifs.length > 0) {
    $("[data-behaviour='notifications-link']").click(function(e) {
      $.ajax({
          url: "/notifications/mark_as_read",
          method: "POST",
          dataType: "JSON",
          success: $("[data-behaviour='unread-count']").text(0)
        })
    });
  $.ajax({
    url: "/notifications.json",
    datatype: "JSON",
    method: "GET",
    success: (data) =>
    $.map(data, function(notification) {
    items = `<a id="item-notif" class="dropdown-item nav-sign" href="${notification.url}">${notification.actor.email} ${notification.action} ${notification.notifiable.type}</a>`
    $("#notifs").append(items)

    })
    });
  };
}
export { notifications };
