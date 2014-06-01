require 'test_helper'

feature 'Signout Feature Test' do
  before do
    signin FactoryGirl.create(:user)
    visit lists_path
  end

  scenario 'signing out clears the current user' do
    click_link 'Sign Out'
    current_path.must_equal signin_path
    page.wont_have_content 'Sign Out'
  end
end
