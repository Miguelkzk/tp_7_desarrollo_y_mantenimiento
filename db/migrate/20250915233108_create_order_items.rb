# frozen_string_literal: true

class CreateOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.references :order
      t.references :product
      t.timestamps
    end
  end
end
