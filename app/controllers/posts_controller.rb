class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @new_post = Post.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.new(post_params)
    @post.author = @user
    if @post.save
      redirect_to user_post_url(id: @post.id, user_id: @user.id)
    else
      render :new
    end
  end

    def post-params
      params.require(:post).permit(:title, :body)
    end
end
