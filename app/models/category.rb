class Category < ApplicationRecord
  has_many :products, dependent: :delete_all
  
  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    column_names
  end
end
