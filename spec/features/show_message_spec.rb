require 'rails_helper'

feature "See user recommendations" do
  # As an authenticated user
  # I want to see the message for my location
  # So that I can plan for the weather

  scenario "Visiting weather message" do
    user = FactoryGirl.create(:user)
    location = FactoryGirl.create(:location)
    UsersLocation.create(user_id: user.id, location_id: location.id)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    click_link 'recommendation'
    expect(page).to have_content "Be prepared for the day's weather"
    expect(page).to have_css('div.blockbody')
  end
end
