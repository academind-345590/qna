require 'rails_helper'

feature 'User answer', %q{
  In order to exchange my knowledge
  As an authrnticated user
  I want to be able to create answers
} do
  given(:user) {create(:user)}
  given(:quetion) {create(:quetion)}

  scenario 'Authenticated user create answer' do
    sign_in(user)
    visit quetion_path(quetion)

    fill_in 'You answer', with: 'My answer'
    click_on 'Create'

    expect(current_path).to eq quetion_path(quetion)
    within '.answer' do
      expect(page).to have_content 'My answer'
    end
  end
end