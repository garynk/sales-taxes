require "minitest/autorun"
require_relative "../shoppingcart"

describe SalesTaxes::ShoppingCart do
  it "must return computed taxes for products that are not imported" do
    product = SalesTaxes::ReportList.new()
    product.taxes.must_equal 2.5
  end
