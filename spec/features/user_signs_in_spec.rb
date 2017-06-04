require 'rails_helper'

feature "Sign up" do
  # As a prospective user
  # I want to create an account
  # So that I can specify my location

  scenario "Specifying valid and required information" do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'Lynn'
    fill_in 'Last Name', with: 'Simpson'
    fill_in 'Password', with: 'password123'
    fill_in 'Password confirmation', with: 'password123'
    fill_in 'Email', with: 'lsimpson@yahoo.com'
    click_button 'Sign up'

    expect(page).to have_content "Welcome! You have signed up successfully."
    expect(page).not_to have_content "Sign Up"
    expect(page).not_to have_content "Sign In"
    expect(page).to have_content "Sign Out"
  end

  scenario "User omits required information" do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign up'

    expect(page).to have_content "First name can't be blank"
    expect(page).to have_content "Last name can't be blank"
    expect(page).to have_content "Password can't be blank"
    expect(page).to have_content "Email can't be blank"
  end

  scenario "User gives invalid information" do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'Lynn'
    fill_in 'Last Name', with: 'Simpson'
    fill_in 'Password', with: '123'
    fill_in 'Password confirmation', with: '321'
    fill_in 'Email', with: 'lsimpson@yhoos'
    click_button 'Sign up'

    expect(page).to have_content "Password is too short (minimum is 6 characters)"
    expect(page).to have_content "Password confirmation doesn't match Password"
  end

  scenario "User gives email address that already has an account" do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: user.first_name
    fill_in 'Last Name', with: user.last_name
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    fill_in 'Email', with: user.email
    click_button 'Sign up'

    expect(page).to have_content "An account already exists for that email address!"
  end
end

feature "sign out" do
  # As an authenticated user
  # I want to sign out
  # So that no one else can see my info

  scenario "successful sign out" do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    click_link "Sign Out"

    expect(page).to have_content "Signed out successfully"
  end
end
