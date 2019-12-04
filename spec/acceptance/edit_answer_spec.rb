require_relative 'acceptance_helper'

feature 'Answer editing', %{
  In order to fix mistake
  As an author of answer
  I'd like  be able to edet answer
} do
  given(:user) {create(:user)}
  given(:quetion) {create(:quetion)}
  given(:answer){create(:answer, quetion: quetion)}

  scenario 'Unauthenticated user try to edit quetion' do
    visit quetion_path(quetion)

    expect(page).to_not have_link 'Edit'
  end

  describe 'Authinticated user' do
    before do
      sign_in user
      visit quetion_path(quetion)
    end
    scenario 'Sees link to Edit' do
      within '.answers' do
        expect(page).to have_link 'Edit'
      end
    end
    scenario 'Try to edit his answer', js: true do
      click_on 'Edit'
      within '.answers' do
        fill_in 'Answer', with: 'Edited answer'
      end
      click_on 'Save'

      expect(page).to_not have_content answer.body
      expect(page).to have_content 'Edited answer'
      expect(page).to_not have_selector 'textarea'
    end
    scenario "Try to edit other user's quetion"
  end

end