require_relative 'acceptance_helper'

feature 'User answer', %q{
  In order to exchange my knowledge
  As an authenticated user
  I want to be able to create answers
} do
  given(:user) {create(:user)}
  given(:quetion) {create(:quetion)}

  scenario 'Authenticated user create answer', js: true do #, js: true  для запуска в Firefox
    sign_in(user)
    visit quetion_path(quetion)

    fill_in 'You answer', with: 'My awesome answer'
    click_on 'Create'

    expect(current_path).to eq quetion_path(quetion)
    within '.answers' do
      expect(page).to have_content 'My awesome answer'
    end
  end

  # scenario 'User try to create invalid answer', js: true do
  #   sign_in(user)
  #   visit quetion_path(quetion)

  #   click_on 'Create'

  #   expect(page).to have_content "Body can't be blank"
  # end


end