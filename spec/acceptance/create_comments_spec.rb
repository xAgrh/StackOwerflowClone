require_relative 'acceptance_helper' 

feature 'Add comments to question', %q{
  In order to exchange my knowlege
  As an authenticated user
  I want to be able to comment questions
} do
  
  given(:user){ create(:user) }  
  given(:question){ create(:question) }
  given!(:answer){ create(:answer, question: question) }
  
  scenario "Authenticated user can comment question" do
    sign_in(user)
    visit question_path(question)
    
    
    click_on 'Комментировать'
    fill_in 'Ваш комментарий', with: 'Комментарий1'
    click_on 'Добавить комментарий'
    
    expect(current_path).to eq question_path(question)
    within "#question-#{question.id}" do
      expect(page).to have_content 'Комментарий1'
    end
  end
 
  
end

feature 'Add comments to answer', %q{
  In order to exchange my knowlege
  As an authenticated user
  I want to be able to comment answers
} do

scenario "Authenticated user can comment answer"


end