class Product < ApplicationRecord
  has_many :order_items
  scope :featured, -> { where(featured: true) }

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :short_description, presence: true
  validates :description, presence: true
end
