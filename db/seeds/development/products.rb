rand_val = 10

50.times do |n|
  Product.create!(
    category_id: rand(rand_val) + 1,
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price
  )
end