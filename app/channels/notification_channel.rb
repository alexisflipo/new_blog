class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from current_user
  end

  def unsubscribed
    stop_all_streams
  end

  def receive(data)
    ActionCable.server.broadcast("notifications:#{params[:id]}", data)
  end
end
