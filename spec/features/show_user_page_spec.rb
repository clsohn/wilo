require 'rails_helper'

feature "Visit user profile page" do
  # As an authenticated user
  # I want to see my location
  # So that I can get a recommendation for that area

  scenario "Visiting user profile page without a location" do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    click_link "Hi #{user.first_name}"
    expect(page).to have_content "First time here?"
    expect(page).to have_link('Profile Info', new_location_path)
    expect(page).to have_link('Change your email or password', edit_user_registration_path)
  end

  scenario "Visiting user profile page with a location" do
    user = FactoryGirl.create(:user)
    location = FactoryGirl.create(:location)
    UsersLocation.create(user_id: user.id, location_id: location.id)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    click_link "Hi #{user.first_name}"
    expect(page).to have_content "Going on a trip?"
    expect(page).to have_link('recommendation', new_user_path)
    expect(page).to have_link('location!', new_location_path)
  end
end
