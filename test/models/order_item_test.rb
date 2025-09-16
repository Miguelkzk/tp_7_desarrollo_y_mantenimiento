require "test_helper"
class OrderItemTest < ActiveSupport::TestCase
  def order_item_valido
    {
      quantity: 2
    }
  end

  def order_item_invalido
    {
      quantity: 0
    }
  end

  def test_order_item_valido
    order = orders(:one)
    product = products(:one)
    order_item = OrderItem.new(order:, product:, **order_item_valido)
    assert order_item.valid?, 'Se esperaba order_item válido'
  end

  def test_order_item_invalido
    order_item = OrderItem.new(**order_item_invalido)
    refute order_item.valid?, 'Se esperaba order_item inválido'
    assert_includes order_item.errors[:quantity], 'must be greater than 0'
  end
end
