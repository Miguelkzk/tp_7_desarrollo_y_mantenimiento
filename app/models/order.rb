class Order < ApplicationRecord
  # ASSOCIATIONS
  has_many :order_items
  has_many :products, through: :order_items

  # VALIDATIONS
  validates :number, presence: true, numericality: { only_integer: true }
  validates :date_at, presence: true
  validates :status, presence: true
end
