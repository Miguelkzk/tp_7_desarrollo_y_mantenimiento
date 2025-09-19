# frozen_string_literal: true

require 'test_helper'
class OrderFlowTest < ActionDispatch::IntegrationTest
  def test_create_order_with_items_and_compute_total
    product1 = products(:one)
    product2 = products(:two)

    # create a fresh order in DB
    order = Order.create(number: 3001, date_at: Time.zone.today, status: 'pending')
    assert order.persisted?

    # add items
    oi1 = OrderItem.create(order:, product: product1, quantity: 2)
    oi2 = OrderItem.create(order:, product: product2, quantity: 1)

    assert oi1.persisted?
    assert oi2.persisted?

    # reload associations
    order.reload
    assert_equal 2, order.order_items.size
    assert_includes order.products, product1
    assert_includes order.products, product2

    total = order.order_items.sum { |item| item.quantity * item.product.price.to_f }

    expected = (2 * product1.price.to_f) + (1 * product2.price.to_f)
    assert_in_delta expected, total, 0.001
  end
end
