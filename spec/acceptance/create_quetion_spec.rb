require 'rails_helper'

feature 'Create quetion', %q{
  In orser to get answer from community
  As an authenticated user
  I want to be able to ask quetions
} do

  scenario 'Authenticated usser creates question' do
    User.create!(email: 'user@test.com', password: '12345678')

    visit new_user_session_path
    fill_in 'Email', with: 'user@test.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'

    visit quetions_path
    click_on 'Ask quetion'
    fill_in 'Title', with: 'Test quetion'
    fill_in "Body", with: "Test text"
    click_on 'Create'

    expect(page).to have_content ""
  end

  scenario 'Non-authenticated user tries to creare quetion' do
    visit quetions_path
    click_on 'Ask quetion'
    
    expect(page).to have_content "You need to sign in or sign up before continuing."
  end

end