module SalesTaxes
  class Product
    BASE_TAX = 0.1
    IMPORT_TAX = 0.05
    IMPORTED = "imported"

    attr_accessor :price, :qty, :name, :imported

    def initialize(name, qty, price, imported)
      @name = name.sub("#{IMPORTED} ", "")
      @qty = qty.to_i
      @price = price.to_f
      @imported = imported
    end

    def total
      qty * price + taxes  
    end
    
    def taxes
      round(price * qty * (self.class::BASE_TAX + import_tax))
    end

    def to_s
      tokens = []
      tokens << qty
      tokens << IMPORTED if imported
      tokens << "#{name}:"
      tokens << "%.2f" % total
      tokens.join(" ")
    end

    private def round(num)
      (num * 20).round / 20.0
    end
   
    private def import_tax
      imported ? IMPORT_TAX : 0
    end
  end

  class Exempt < Product
    BASE_TAX = 0.0
  end
end
