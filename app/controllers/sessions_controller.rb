require 'base64'

class SessionsController < ApplicationController
  skip_before_action :require_login

  def create
    data = SessionService.access_token(params[:code])
    user          = User.find_or_create_by(uid: data[1][:data][:id])
    user.uid      = data[1][:data][:id]
    user.token    = data[0]
    user.save

    session[:user_id] = user.id
    # Faraday.post("https://nameless-plains-48795.herokuapp.com/api/v1/meal_plans?user_id=#{user.id}&title=#{user.id}'s Meal Plan")
    redirect_to dashboard_path
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have been logged out!'
    redirect_to '/'
  end
end
