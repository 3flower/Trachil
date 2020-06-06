# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do |n|
    User.create!(
      email: "test#{n + 1}@test.com",
      name: "テストユーザー#{n + 1}",
      password: "123456",
      residence: "東京都#{n + 1}",
      is_child: true,
      child_people: "#{n + 1}",
      child_age: "#{n + 1}",
      is_diaper: true,
      is_baby_food: true,
    )
end
5.times do |n|
    User.create!(
      email: "test#{n + 1}@test1.com",
      name: "テストユーザー#{n + 1}",
      password: "123456",
      residence: "東京都#{n + 1}",
      is_child: false,
    )
end
