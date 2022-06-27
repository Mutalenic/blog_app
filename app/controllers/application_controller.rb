class ApplicationController < ActionController::Base
    def all_users
    User.all
  end

  def current_post
    User.find(params[:id] || params[:user_id]).posts.find(params[:post_id])
  end
end
