require 'test_helper'

feature 'Signin Feature Test' do
  scenario 'signing in with a valid email address or password' do
    user = FactoryGirl.create :user, password: 'p@ssword'
    visit signin_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'p@ssword'
    click_button 'Sign In'

    current_path.must_equal lists_path
    page.must_have_content "Welcome #{user.name}"
  end

  scenario 'signining in with an email address and password that do not match' do
    user = FactoryGirl.create :user, password: 'testing123'
    visit signin_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'p@ssword'
    click_button 'Sign In'

    current_path.must_equal '/sessions'
    page.must_have_content "Invalid email or password"
  end
end
