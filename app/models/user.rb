class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :email, :password, :password_confirmation, :username, :name

  validates :name,      :presence => true
  validates :email,     :presence => true,
                        :uniqueness => true,
                        :format => { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/  }
  validates :username,  :presence => true,
                        :uniqueness => true
  validates :password,  :presence => true, if: :password,
                        :confirmation => true, if: :password
end
