class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless current_user
      flash[:error] = 'You must be logged in to view this page'
      redirect_to root_path
    end
  end
end
