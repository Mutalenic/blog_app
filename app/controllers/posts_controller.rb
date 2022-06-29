class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
    @current_user = current_user
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.likes_counter = 0
    @post.comments_counter = 0
    @user = current_user
    if @post.save
      flash[:success] = 'Post saved!'
      redirect_to user_post_url(@user, @post)
    else
      flash[:error] = 'Post not saved!'
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.author_id)
  end

  def destroy
    @post = Post.find(params[:id])
    @author = User.find(@post.author_id)
    @author.posts_counter -= 1
    @post.destroy!
    redirect_to root_path, notice: 'Post was successfully deleted.'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
