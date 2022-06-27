class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :update_allowed_params, if: :devise_controller?

  protected

  def updated_allowed_params
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end

  def all_users
    User.all
  end

  def current_post
    User.find(params[:id] || params[:user_id]).posts.find(params[:post_id])
  end
end
