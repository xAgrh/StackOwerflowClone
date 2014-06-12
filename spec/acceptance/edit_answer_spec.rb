require_relative 'acceptance_helper'

feature 'Answer editing', %q{
  In order to fix mistake
  As an autor of answer
  I'd like to be able to edit my answer
} do
  
  given!(:users)    { create_pair(:user)}
  given!(:question) { create(:question, user: users[0]) }
  given!(:answer1)  { create(:answer, question: question, user: users[0]) }
  given!(:answer2)  { create(:answer, question: question, user: users[1]) }
  
  scenario 'Unauthentiated user try to edit answer' do
    visit question_path(question)
    within '.answers' do
      expect(page).to_not have_link 'Редактировать'
    end
  end
  
  describe 'Authenticated user', js: true do
    before do
      sign_in(users[0])
      visit question_path(question)
    end    
  
    scenario 'sees link to Edit his answer' do
                
      within "#answer-#{answer1.id}" do
        expect(page).to have_link 'Редактировать'
      end
    end
    
    scenario 'try to cancel edit answer', js: true do

      within "#answer-#{answer1.id}" do
        click_on 'Редактировать'
        fill_in 'Ответ', with: 'Отредактировано'
        click_on 'Отмена'
        expect(page).to_not have_content 'Отредактировано'
      end
    end

    
  
    scenario 'try to edit his answer', js: true do
      
      within "#answer-#{answer1.id}" do
        click_on 'Редактировать'
        fill_in 'Ответ', with: 'Исправлено'
        click_on 'Сохранить'

      end
      
      within ".answers #answer-#{answer2.id} .edit-answer" do
        expect(page).to_not have_selector 'textarea'
      end
      
      expect(page).to have_content 'Исправлено'
    end
  
  
    scenario "user dont see edit link"  do
      visit question_path(question)
      
      within "#answer-#{answer2.id}" do
        expect(page).to_not have_link 'Редактировать'
      end
    end
    
    
  end
end