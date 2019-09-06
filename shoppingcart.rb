require_relative "./product"

module SalesTaxes
  class ShoppingCart
    def initialize(product_list)
      @product_list = product_list
    end
    
