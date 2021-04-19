require 'rails_helper'

describe 'As a user' do
  describe 'once I\'ve logged in' do
    before :each do
      @user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit '/dashboard'
    end

    it "takes me top the dashboard and shows a welcome message and displays username" do
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Welcome to Recipes on Rails #{@user.uid}")
    end

    it "shows 7 days" do
      within(".meal-plan-week") do
        expect(page.all('p', count: 7))
        expect(page).to have_button("Add Meal")
      end
    end

    it "shows a button to view past recipes" do
      save_and_open_page
      expect(page).to have_button("Past Recipes")
    end

    it "shows a button to email meal plan" do
      save_and_open_page
      expect(page).to have_button("Past Recipes")
    end
  end
end
