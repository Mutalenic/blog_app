class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @user = current_user
  end

  def create
    user = current_user
    post = current_post
    comment = Comment.new(comment_params)
    comment.author = user
    comment.post = post
    if comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to user_post_url(id: post.id)
    else
      flash[:Error] = 'Comment was not created.'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
