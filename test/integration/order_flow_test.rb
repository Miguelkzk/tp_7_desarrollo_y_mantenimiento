require "test_helper"

class OrderFlowTest < ActionDispatch::IntegrationTest
  test "create order with items and compute total" do
    order = orders(:one)
    product = products(:one)

    # ensure starting from fixtures
    oi = OrderItem.create(order: order, product: product, quantity: 3)
    assert oi.persisted?

    total = order.order_items.sum do |item|
      item.quantity * item.product.price.to_f
    end

    assert_equal 3 * product.price.to_f, total
  end
end
