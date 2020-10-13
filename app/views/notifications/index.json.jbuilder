
json.array! @notifications do |notification|
json.count current_user.notifications.unread.count
  # json.recipient notification.recipient
  json.actor notification.actor
  json.action notification.action
  json.notifiable do
    json.type " a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end
  json.address article_path(notification.article_id)
  json.url article_path(notification.article_id, anchor: dom_id(notification.notifiable))
end
