require_relative 'acceptance_helper'

feature 'Add file to quetion', %q{
  Inorder to aillustrate my quetop
  As an quetion's author
  I'd like to be able to attach files
} do

  given(:user){create(:user)}

  background do
    sign_in(user)
    visit new_quetion_path
  end

  scenario 'User adds file when asks quetion' do

    fill_in 'Title', with: 'Test quetion'
    fill_in 'Text', with: 'text text text'
    attach_file 'File', "#{Rails.root}/spec/spec_helper.rb"
    click_on 'Create'

    expect(page).to have_link 'spec_helper.rb', href: '/uploads/attachment/file/1/spec_helper.rb'

  end

end