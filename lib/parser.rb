require "product"

module SalesTaxes
  class Parser
    EXEMPT = ["chocolate","book", "pill", "tablet", "medicine", "dose"]
    
    def initialize(input)
      @tokens = input.split(" ")
    end

    def call
      klass = exempt ? Exempt : Product
      klass.new(name, qty, price, imported)
    end
    
    private def qty
      @tokens[0]
    end

    private def name
      @tokens.slice(1, 3).join(" ")
    end 
     
    private def price
      @tokens[-1]
    end
    
    private def imported
      @tokens.include? "imported"
    end
    
    private def exempt
      input = @tokens.join(" ")
      EXEMPT.any? { |token| input.include?(token) }
    end
  end
end
