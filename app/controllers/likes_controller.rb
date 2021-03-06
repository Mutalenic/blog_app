class LikesController < ApplicationController
  def create
    like = Like.new(author: current_user, post: current_post)
    if like.save
      flash[:success] = 'Post liked!'
      redirect_to user_post_url(current_user, current_post)
    else
      flash[:error] = 'Can\'t like post twice!'
      redirect_to { new_user_post(current - user) }
    end
  end
end
