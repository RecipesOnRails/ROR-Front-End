class DashboardController < ApplicationController
  def show
    @skip_dashboard = true
  end
end
