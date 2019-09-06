require_relative "./product"
require_relative "./parser"

module SalesTaxes
  class Renderer
    
    def initialize(product_list)
      @product_list = product_list
    end
  
    def show
      for product in @product_list
        output = @product.qty.to_s + insert_imported(product) + " " + @product.name + ":" + " " + @product.total.to_s + "\n"
      end
    end
    
    private def insert_imported(product)
       product.imported ? "imported " : ""
    end
  end
end
