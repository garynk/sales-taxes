require "helper"

describe SalesTaxes::ShoppingCart do
  let(:products) { [SalesTaxes::Exempt.new("imported fantasy book", 2, 12.49, true), SalesTaxes::Exempt.new("business book", 1, 79.99, false)] }
  
  it "must return the total price of the products" do
    shopping_cart = SalesTaxes::ShoppingCart.new(products)
    shopping_cart.total.must_equal 106.22
  end
  
  it "must return the total taxes of the products" do
    shopping_cart = SalesTaxes::ShoppingCart.new(products)
    shopping_cart.taxes.must_equal 1.25
  end
  
  it "must return the shopping cart string" do
    shopping_cart = SalesTaxes::ShoppingCart.new(products)
    shopping_cart.to_s.must_equal "2 imported fantasy book: 26.23\n1 business book: 79.99\nSales Taxes: 1.25\nTotal: 106.22"
  end
  
  it "must print at least two decimals" do
    shopping_cart = SalesTaxes::ShoppingCart.new([SalesTaxes::Product.new("music CD", 1, 10.00, false)])
    shopping_cart.to_s.must_equal "1 music CD: 11.00\nSales Taxes: 1.00\nTotal: 11.00"
  end
end
