require 'base64'

class SessionsController < ApplicationController
  def create
    data = SessionService.access_token(params[:code])
    user          = User.find_or_create_by(uid: data[1][:data][:id])
    user.uid      = data[1][:data][:id]
    user.token    = data[0]
    user.save

    session[:user_id] = user.id
    redirect_to dashboard_path
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have been logged out!'
    redirect_to '/'
  end
end
