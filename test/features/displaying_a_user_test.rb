require 'test_helper'

feature 'Displaying a User Feature Test' do
  scenario 'displaying an existing user' do
    user = FactoryGirl.create :user, email: 'hello@example.com'
    signin user
    visit user_path user
    page.must_have_content 'hello@example.com'
  end
end
