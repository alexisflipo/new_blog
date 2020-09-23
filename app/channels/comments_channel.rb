class CommentsChannel < ApplicationCable::Channel
  def subscribed
    commentary = Comment.find(params[:id])
    stream_from commentary
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
