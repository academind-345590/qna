require 'rails_helper'

feature 'Create quetion', %q{
  In orser to get answer from community
  As an authenticated user
  I want to be able to ask quetions
} do

  given(:user) {create(:user)}

  scenario 'Authenticated usser creates question' do
    sign_in(user)

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