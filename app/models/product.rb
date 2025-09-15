class Product < ApplicationRecord
  # ASSOCIATIONS
  has_many :order_items
  has_many :orders, through: :order_items
end
