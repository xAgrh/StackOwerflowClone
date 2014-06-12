require_relative 'acceptance_helper'

feature 'Add tags to question', %q{
  In order to help with navigation in questions
  As an question's author
  I'd like to be able to add tags
} do
  
  given(:user){ create(:user) }
  
  background do
    sign_in(user)
    visit new_question_path
  end
  
  scenario 'User adds tags when ask question' do
    fill_in 'Title', with: 'Test question'
    fill_in 'Text', with: 'text text text'
    fill_in 'Tag', with: 'Rails'
    
    click_on 'Create'
    
    within '.question_tags' do
      expect(page).to have_link "Rails"
    end
  end
end
