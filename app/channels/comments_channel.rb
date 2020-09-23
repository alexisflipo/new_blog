class CommentsChannel < ApplicationCable::Channel
  def subscribed
    comment = Comment.find(params[:id])
    stream_from comment
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
