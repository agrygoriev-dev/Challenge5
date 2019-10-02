# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category

  validates :title, :price, :stock_quantity, presence: true

  def self.average_by_price
    average(:price)
  end

  def self.summed_quantity
    sum(:stock_quantity)
  end
end
