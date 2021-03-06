require 'rails_helper'

RSpec.describe 'Welcome Page' do
  it 'Displays login content' do
    visit '/'

    description = 'This app allows you to create meal plans based on meals that share common ingredients with one another. Share meal plans and order from store through the app.'

    expect(page).to have_content("Welcome To Recipes On Rails")
    expect(page).to have_content(description)
    expect(page).to have_link("Login With Kroger")
  end
end
