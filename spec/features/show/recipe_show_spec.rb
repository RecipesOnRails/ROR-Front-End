require 'rails_helper'

RSpec.describe 'Recipe Show Page' do
  it 'Displays login content' do
    visit '/recipes/123'

    expect(page).to have_content("Tart Green Salad with Avocado Dressing")

  end
end
