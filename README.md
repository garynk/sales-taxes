# Table of Contents
* [Scope](#scope)
* [Design](#design)
  * [Product](#product)
  * [Parser](#parser)
  * [ShoppingBag](#shoppingbag)
  * [Renderer](#renderer)
* [Installation](#installation)
  * [Runtime](#runtime)
  * [Dependencies](#dependencies)
  * [Testing](#testing)
  * [Gem](#gem)
* [Usage](#usage)

# Scope
This gem is the Ruby implementation of the `Sales Taxes` code-kata (for more information refer to the [OBJECTIVES](https://github.com/costajob/sales_taxes/blob/master/OBJECTIVES.md)).

# Design
The code design follows the single responsibility principle by using a dedicated class/module for any specific task.

## Product
Represents the product data and the taxes rules. Uses polymorphism to deal with different tax types. Has a string appropriate representation.

## Parser
Embeds the parsing rules to detect and factory products given the appropriate input.

## ShoppingBag
A simple products bag. Includes a string representation with total values.

## Renderer
The renderer class accepts a file path and tokenize its content transforming each element in groups of shopping bag objects. Provides a string representation logic.

# Installation

## Runtime
This library supports from `Ruby 2.4.1` on.

## Dependencies
There are no runtime dependencies, but some developments ones (testing).  
Just clone the repository, move to the directory and use `bundler`:
```shell
bundle install
```

## Testing
The code is covered by fast, isolated unit testing.  
Move to the installation path and run them by:
```shell
bundle exec rake
Run options: --seed 47327

# Running:

................

Finished in 0.007032s, 2275.3129 runs/s, 4550.6257 assertions/s.

16 runs, 32 assertions, 0 failures, 0 errors, 0 skips
```

## Gem
The library is packaged as a `gem`. Build and install it by:
```shell
gem build sales_taxes.gemspec
...
gem install --local ./sales_taxes.gem
```

# Usage
The gem provides a binary that accepts a path to the `input file`:
```shell
sales_taxes input.txt

OUTPUT:

Output 1:
2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32

Output 2:
1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.65
Sales Taxes: 7.65
Total: 65.15

Output 3:
1 imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
3 imported box of chocolates: 35.45
Sales Taxes: 7.80
Total: 98.28
```
