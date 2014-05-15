require_relative 'acceptance_helper'

feature 'Sign in', %q{
  In order to be able ask questions
  As an user
  I want to be able to sign in
} do
  
  given(:user) { create(:user) }
  
  scenario "Existing User try to sign in" do
    sign_in(user)
    expect(page).to have_content 'Вход в систему выполнен.'
  end
  
  scenario "Existing User try to sign in with invalid password" do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'wrongpassword'
    click_on 'Sign in'
    
    expect(page).to have_content 'Неверный email или пароль.'
    
  end
  
  scenario "Non-existing user try to sign in" do
    visit new_user_session_path
    fill_in 'Email', with: 'wronguser@test.com'
    fill_in 'Password', with: '12345'
    click_on 'Sign in'
    
    expect(page).to have_content 'Неверный email или пароль.'
  end
end
