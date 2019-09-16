require "parser"
require "shopping_cart"

module SalesTaxes
  class Renderer
    def initialize(file_name)
      @file_name = File.expand_path(file_name)
    end
    
    def to_s
      tokens = []
      data.each do |key, products|
        tokens << key.sub("Input", "Output")
        tokens << ShoppingCart.new(products).to_s
        tokens << ''
      end
      tokens.join("\n")
    end

    private def data
      key = nil
      File.readlines(@file_name).each_with_object({}) do |line, acc|
        key = line.strip if line.start_with?('Input')
        acc[key] = [] unless acc[key]
        acc[key] << Parser.new(line.strip).call if line.match?(/^\d/)
      end
    end
  end 
end
