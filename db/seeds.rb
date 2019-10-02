# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 676.times do
#  Product.create(title: Faker::Lorem.word,
#                 price: Faker::Number.decimal(l_digits: 2),
#                 stock_quantity: Faker::Number.number(digits: 2))
# end
Product.destroy_all
Category.destroy_all

csv_file = Rails.root + 'db/products.csv'
products = SmarterCSV.process(csv_file)

products.each do |product|
  category = Category.find_or_create_by(name: product[:category])
  product_record = category.products.build(title: product[:name],
                                           description: product[:description],
                                           price: product[:price],
                                           stock_quantity: product[:stock_quantity])
  product_record.save
end
