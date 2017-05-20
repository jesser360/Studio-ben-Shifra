class User < ApplicationRecord
  has_many :messages
  has_many :orders
  has_secure_password

validates :username, presence: true,
uniqueness: { case_sensitive: false },
length: { minimum: 3, maximum: 25 }

validates :password, presence: true,
length: { minimum: 3, maximum: 25 }, on: :create
end
