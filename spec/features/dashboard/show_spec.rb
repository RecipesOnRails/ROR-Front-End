require 'rails_helper'

describe 'As a user' do
  describe 'once I\'ve logged in' do
    before :each do
      @user = create(:user)
    end
    it 'should take me to the dashboard show page' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit '/dashboard'

      expect(page).to have_content("Welcome, #{@user.uid}")
    end
  end
end
