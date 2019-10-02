# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all
    @average_price = @products.average_by_price.round(2)
    @total_quantity = @products.summed_quantity
  end
end
