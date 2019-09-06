require "minitest/autorun"
require_relative "../renderer"

describe SalesTaxes::Renderer do

=begin
  it "must return an input that is a String given a product" do
    product = SalesTaxes::Product.new("watch", 2, 12.49, false)
    render = SalesTaxes::Renderer.new(product)
    render.show.must_be_instance_of Array
    end
=end
    it "must return an input that is a String in an exact format" do
    product = SalesTaxes::Exempt.new("book", 2, 12.49, false)
    product2 = SalesTaxes::Exempt.new("imported chocolate", 2, 15.99, true)
    a = new.Array
    a.push(product)
    a.push(product_2)
    render = SalesTaxes::Renderer.new(a)
    render.show.must_equal "2 book: 24.98"
    end
end
