class MealplansController < ApplicationController

  def create
    # meal_plan_poro = MealplanPoro.new(mealplan_poro_params)
    # serialized_mealplan = MealplanSerializer.new(meal_plan_poro)
    # test = render json: serialized_mealplan, status: :created
    Faraday.post("https://nameless-plains-48795.herokuapp.com/api/v1/mealplans?user_id=#{current_user.id}&recipe_id=#{mealplan_params}")
  end

  private

  def mealplan_params
    params[:recipe]
  end
end
