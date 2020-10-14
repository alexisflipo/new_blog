def comment_broadcast
  ActionCable.server.broadcast "comments_channel",
  render_to_string(partial: 'comments/comment', object: @comment)
end

def notification_broadcast
  ActionCable.server.broadcast "notification_channel",
  render_to_string(partial: 'notifications/notification', object: @notification)
end
