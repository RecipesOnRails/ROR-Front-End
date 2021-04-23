class DashboardController < ApplicationController
  def show
    response = Faraday.post("https://nameless-plains-48795.herokuapp.com/api/v1/meal_plans?user_id=#{current_user.id}&title=#{current_user.id}'s Meal Plan")
    @meal_plan = JSON.parse(response.body, symbolize_names: true)
    @skip_dashboard = true
    session[:meal_plan] = @meal_plan[:data][:id]
    # binding.pry
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
