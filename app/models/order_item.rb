class OrderItem < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :order
  belongs_to :product
end
