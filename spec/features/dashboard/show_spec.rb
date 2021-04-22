require 'rails_helper'

describe 'As a user' do
  describe "As an unauthenticated user" do
    describe "when I visit the dashboard page it" do
      it "redirects me to the login page with a flash message" do
        visit dashboard_path

        expect(current_path).to eq(root_path)
        expect(page).to have_content("You must be logged in to view this page")
      end
    end
  end
  
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
      expect(page).to have_button("Past Recipes")
    end

    it "shows a button to email meal plan" do
      expect(page).to have_button("Past Recipes")
    end

    it 'sends out email' do
      fill_in :email, with: "bobgu@gmail.com"
      click_button "Email Meal Plan"

      expect(ActionMailer::Base.deliveries.count).to eq(1)
      email = ActionMailer::Base.deliveries.last
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Your meal plan has been sent.")

    end
  end
end
