module SalesTaxes
  class ShoppingCart
    def initialize(products)
      @products = products
    end
    
    def taxes
      @products.sum(&:taxes)
    end
    
    def total
      @products.sum(&:total)
    end
    
    def to_s
      tokens = @products.map(&:to_s)
      tokens << "Sales Taxes: %.2f" % taxes
      tokens << "Total: %.2f" % total
      tokens.join("\n")
    end
  end
end
