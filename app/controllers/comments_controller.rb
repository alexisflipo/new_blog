class CommentsController < ApplicationController
  before_action :set_article
  def create
    unless current_user
      flash[:alert] = "Please sign in or sign up first"
      redirect_to new_user_session_path
    else
      @comment = @article.comments.build(comment_params)
      @comment.user = current_user
      if @comment.save
        @notification = Notification.create(recipient: @article.user, actor: current_user, action:"posted", notifiable: @comment, article: @article)
        comment_broadcast
        notification_broadcast
        flash[:notice] = "Comment has been successfully created"
      redirect_to article_path(@article)
      else
        flash[:alert] = "Comment has not been created"
        redirect_to article_path(@article)
      end
    end
  end

  private


  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end
