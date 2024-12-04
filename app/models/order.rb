class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :gst, :hst, :pst, numericality: { greater_than_or_equal_to: 0 }
  validates :address, presence: true

  def self.ransackable_associations(auth_object = nil)
    super + ["order_items"]
  end

  def self.ransackable_attributes(auth_object = nil)
    super + ["email", "gst", "pst", "hst", "address", "customer_id"]
  end
end
