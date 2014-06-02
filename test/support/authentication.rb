module Authentication
  module Helpers
    def signin(user, password = 'p@ssword')
      visit signin_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: password
      click_button 'Sign In'
    end

    def basic_auth(user, password = 'p@ssword')
      request.env['HTTP_AUTHORIZATION'] =
        "Basic " + Base64::encode64("#{user.email}:#{password}")
    end
  end
end
