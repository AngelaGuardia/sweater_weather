class User < ApplicationRecord
  has_secure_token :api_key
  has_secure_password

  validates :email, :password, presence: true
  validates :email, :api_key, uniqueness: true
  validates :password, confirmation: true
end
