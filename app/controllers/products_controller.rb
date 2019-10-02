# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all
    @average_price = @products ? @products.average_by_price.round(2) : 0
    @total_quantity = @products ? @products.summed_quantity : 0
  end
end
