require_relative 'acceptance_helper'

feature 'Add files to answer', %q{
  In order to illustrate my answer
  As an answer's author
  I'd like to be able to attach files
} do
  
  given(:user){ create(:user) }
  given(:question){ create(:question) }
  
  background do
    sign_in(user)
    visit question_path(question)
  end
  
  scenario 'User adds files when answer on question', js: true do
    fill_in 'Your answer', with: 'My answer'
    click_on 'Add file'
    attach_file 'File', "#{Rails.root}/spec/spec_helper.rb"
    click_on 'Create'
    
    within '.answerattach' do  
    expect(page).to have_link "spec_helper.rb"
    end
  end
end
