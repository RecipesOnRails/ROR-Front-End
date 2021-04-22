class DashboardController < ApplicationController
  def show
    @skip_dashboard = true
  end

  def create_email
    recipient = params[:email]

    email_info = {
      user: current_user,
      friend: params[:friends_email],
      message: "Hi"
      }
    FriendNotifierMailer.inform(email_info, recipient).deliver_now
    flash[:notice] = "Your meal plan has been sent."
    redirect_to dashboard_path
  end
end
