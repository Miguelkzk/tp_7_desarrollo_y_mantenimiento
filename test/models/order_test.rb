# frozen_string_literal: true

require 'test_helper'
class OrderTest < ActiveSupport::TestCase
  def order_valida
    {
      number: 2001,
      date_at: Time.zone.today,
      status: 'pending'
    }
  end

  def order_invalida
    {
      number: nil,
      date_at: nil,
      status: ''
    }
  end

  def test_order_valida
    order = Order.new(order_valida)
    assert order.valid?, 'Se esperaba orden válida'
  end

  def test_order_invalida
    order = Order.new(order_invalida)
    assert_not order.valid?, 'Se esperaba orden inválida'
    assert_includes order.errors[:number], "can't be blank"
    assert_includes order.errors[:date_at], "can't be blank"
    assert_includes order.errors[:status], "can't be blank"
  end
end
