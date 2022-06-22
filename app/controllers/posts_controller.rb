class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(created_at: :desc).limit(3)
    end   

  def show
    @post = Post.find(params[:id])
  end
end
