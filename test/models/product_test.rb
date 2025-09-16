require "test_helper"
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
    refute product.valid?, 'Se esperaba producto inválido'
    assert_includes product.errors[:name], "can't be blank"
    assert_includes product.errors[:price], 'must be greater than or equal to 0'
    assert_includes product.errors[:stock], 'must be greater than or equal to 0'
  end

  def test_nombre_en_blanco
    produt = Product.new(producto_valido.merge(name: ''))
    refute produt.valid?
    assert_includes produt.errors[:name], "can't be blank"
  end

  def test_price_negative
    produt = Product.new(producto_valido.merge(price: -0.01))
    refute produt.valid?
    assert_includes produt.errors[:price], 'must be greater than or equal to 0'
  end

  def test_stock_no_negativo
    produt = Product.new(producto_valido.merge(stock: -1))
    refute produt.valid?
    assert_includes produt.errors[:stock], 'must be greater than or equal to 0'
  end
end
