const notifications = () => {
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
  }
  };

export { notifications };
