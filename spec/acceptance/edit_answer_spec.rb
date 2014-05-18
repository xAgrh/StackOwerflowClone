require_relative 'acceptance_helper'

feature 'Answer editing', %q{
  In order to fix mistake
  As an autor of answer
  I'd like to be able to edit my answer
} do
  
  given!(:users)    { create_pair(:user)}
  given!(:question) { create(:question) }
  given!(:answer)   { create(:answer, question: question) }
  given!(:answer1)  { create(:answer, question: question, user: users[0]) }
  given!(:answer2)  { create(:answer, question: question, user: users[1]) }
  
  scenario 'Unauthentiated user try to edit answer' do
    visit question_path(question)
    within '.answers' do
      expect(page).to_not have_link 'Редактировать'
    end
  end
  
  describe 'Authenticated user' do
    before do
      sign_in(users[0])
      visit question_path(question)
    end    
  
    scenario 'sees link to Edit his answer' do
      within "#answer-#{answer1.id}" do
        expect(page).to have_link 'Редактировать'
      end
    end
  
    scenario 'try to edit his question', js: true do
      click_on 'Редактировать'
      within '.answers' do
        fill_in 'Answer', with: 'edited answer'
	click_on 'Save'
      
        expect(page).to_not have_content answer.body
        expect(page).to have_content 'edited answer'
        expect(page).to_not have_selector 'textarea'
      end
      
    end
  
  
    scenario "try to edit other user's question" 
    
    
  end
  
end