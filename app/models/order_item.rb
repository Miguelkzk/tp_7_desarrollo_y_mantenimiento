# frozen_string_literal: true

class OrderItem < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :order
  belongs_to :product

  # VALIDATIONS
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
