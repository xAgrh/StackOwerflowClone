require_relative 'acceptance_helper'

feature 'Sign out', %q{
  In order to be able sign out
  As an user
  I want to be able to sign out
} do
  
  given(:user) { create(:user) }
  
  scenario "Existing User try to sign out" do
    sign_in(user)
    click_on 'Sign out' 

    expect(page).to have_content 'Выход из системы выполнен.'
  end
  
end