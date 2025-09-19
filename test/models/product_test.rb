# frozen_string_literal: true

require 'test_helper'
class ProductTest < ActiveSupport::TestCase
  def producto_valido
    {
      name: 'Producto X',
      price: 10.50,
      stock: 5
    }
  end

  def producto_invalido
    {
      name: '',
      price: -1,
      stock: -3
    }
  end

  def test_producto_valido
    product = Product.new(producto_valido)
    assert product.valid?, 'Se esperaba producto válido'
  end

  def test_producto_invalido
    product = Product.new(producto_invalido)
    assert_not product.valid?, 'Se esperaba producto inválido'
    assert_includes product.errors[:name], "can't be blank"
    assert_includes product.errors[:price], 'must be greater than or equal to 0'
    assert_includes product.errors[:stock], 'must be greater than or equal to 0'
  end

  def test_nombre_en_blanco
    produt = Product.new(producto_valido.merge(name: ''))
    assert_not produt.valid?
    assert_includes produt.errors[:name], "can't be blank"
  end

  def test_price_negative
    produt = Product.new(producto_valido.merge(price: -0.01))
    assert_not produt.valid?
    assert_includes produt.errors[:price], 'must be greater than or equal to 0'
  end

  def test_stock_no_negativo
    produt = Product.new(producto_valido.merge(stock: -1))
    assert_not produt.valid?
    assert_includes produt.errors[:stock], 'must be greater than or equal to 0'
  end
end
