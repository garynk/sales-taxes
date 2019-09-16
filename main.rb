$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))

p $LOAD_PATH

require 'renderer'

if $PROGRAM_NAME == __FILE__
  puts SalesTaxes::Renderer.new(ARGV[0])
end
