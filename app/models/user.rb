class User < ApplicationRecord
  # Devise modules to manage authentication
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations and other logic
  has_many :orders, dependent: :delete_all
end
