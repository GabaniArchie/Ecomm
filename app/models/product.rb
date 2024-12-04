class Product < ApplicationRecord
  # Associations
  belongs_to :category
  has_many :order_items, dependent: :delete_all

  # Validations
  validates :name, presence: true
  validates :price, presence: true, numericality: { message: 'must be numeric' }
  validates :description, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["category", "order_items"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "id_value", "name", "price", "updated_at"]
  end
end
