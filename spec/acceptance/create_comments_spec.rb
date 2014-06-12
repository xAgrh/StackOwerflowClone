require_relative 'acceptance_helper' 

feature 'Add comments to question', %q{
  In order to exchange my knowlege
  As an authenticated user
  I want to be able to comment questions
} do
  
  given(:user){ create(:user) }  
  given!(:question){ create(:question, user: user) }
  
  scenario "Authenticated user can comment question", js: true do
    sign_in(user)
    visit question_path(question)
    
    click_on 'Комментировать вопрос'
    fill_in 'Поле', with: 'Комментарий1'
    click_on 'Добавить комментарий'
    
    
    within ".comments" do
      expect(page).to have_content 'Комментарий1'
    end

  end
 
  
end

feature 'Add comments to answer', %q{
  In order to exchange my knowlege
  As an authenticated user
  I want to be able to comment answers
} do
  
  given(:user){ create(:user) }  
  given!(:question){ create(:question, user: user) }
  given!(:answer){ create(:answer, question: question, user: user) }

  
  scenario "Authenticated user can comment answer", js: true do
    sign_in(user)
    visit question_path(question)
    
    click_on 'Комментировать ответ'
    within ".add_comment_to_answer" do
      fill_in 'Поле', with: 'Комментарий2'
      click_on 'Добавить комментарий'
    end
    
    
    within ".comments_in_answer" do
      expect(page).to have_content 'Комментарий2'
    end
    
    
  end


end