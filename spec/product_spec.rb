require "minitest/autorun"
require_relative "../product"

describe SalesTaxes::Product do
  it "must return computed taxes for products that are not imported" do
    product = SalesTaxes::Product.new("watch", 2, 12.49, false)
    product.taxes.must_equal 2.5
  end

  it "must return computed taxes for imported products" do
    product = SalesTaxes::Product.new("imported shoes", 1, 89.99, true)
    product.taxes.must_equal 13.5
  end

  it "must return zero taxes for not imported exempt" do
    product = SalesTaxes::Exempt.new("book", 1, 14.99, false)
    product.taxes.must_equal 0
  end

  it "must return only TAX_IMPORT for imported exempt" do
    product = SalesTaxes::Exempt.new("medicine", 1, 26.99, true)
    product.taxes.must_equal 1.35
  end
  
  it "must return the total price including taxes" do
    product = SalesTaxes::Product.new("book", 2, 12.49, false)
    product.total.must_equal 24.98
  end
end
