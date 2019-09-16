require 'helper'

describe SalesTaxes::Renderer do
  it "must be represented as a string" do
    renderer = SalesTaxes::Renderer.new("input.txt")
    renderer.to_s.scan(/Output \d/).must_equal ["Output 1", "Output 2", "Output 3"]
  end
end
