# frozen_string_literal: true

class Product < ApplicationRecord
  # ASSOCIATIONS
  has_many :order_items
  has_many :orders, through: :order_items

  # VALIDATIONS
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
