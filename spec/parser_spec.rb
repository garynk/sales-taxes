require "minitest/autorun"
require_relative "../parser"

describe SalesTaxes::Parser do
  it "must return a Product object when the input is a String" do
    parser = SalesTaxes::Parser.new("1 imported bottle of perfume at 32.19")
    parser.call.must_be_instance_of SalesTaxes::Product
  end
  
  it "must return the correct name as the input" do
    parser = SalesTaxes::Parser.new("1 bottle of perfume at 32.19")
    parser.call.name.must_equal("bottle of perfume")
  end
  
  it "must return the correct price as the input" do
    parser = SalesTaxes::Parser.new("1 bottle of perfume at 32.19")
    parser.call.price.must_equal(32.19)
  end
  
  it "must return the correct quantity as the input" do
    parser = SalesTaxes::Parser.new("2 bottle of perfume at 32.19")
    parser.call.qty.must_equal(2)
  end
  
  it "must return the imported status" do
    parser = SalesTaxes::Parser.new("1 box of imported chocolates at 32.19")
    parser.call.imported.must_equal(true)
  end
  
  it "should be able to know if it is or not an exempt product" do
    parser = SalesTaxes::Parser.new("1 box of imported chocolates at 32.19")
    parser.call.must_be_instance_of SalesTaxes::Exempt
  end
end
