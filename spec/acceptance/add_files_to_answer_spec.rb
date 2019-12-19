require_relative 'acceptance_helper'

feature 'Add files to answer', %q{
  In order to illustrate my answer
  As an answer's athor
  I'd like to be able to attach files
} do
   
  given(:user){create(:user)}
  given(:quetion){create(:quetion)}

  background do
    sign_in(user)
    visit quetion_path(quetion)
  end

  scenario 'User adds file when asks quetion' do
    #fill_in 'Your answer', with: 'My answer'
    attach_file 'File', "#{Rails.root}/spec/spec_helper.rb"
    click_on 'Create'

    within '.answers' do
      expect(page).to have_link 'spec_helper.rb',  href: '/uploads/attachment/file/1/spec_helper.rb'
    end
  end

end