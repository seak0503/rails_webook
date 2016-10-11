10.times do
  Category.create!(
    name: Faker::Commerce.department
  )
end