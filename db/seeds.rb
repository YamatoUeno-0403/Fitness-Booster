# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'admin1@naganocake.com',
  password: ENV['admin_login_password']
)
Admin.create!(
  email: 'admin2@naganocake.com',
  password: 'admin2'
)
Admin.create!(
    email: "tester@test.com",
    password: "tester",
)
5.times do |n|
  Customer.create!(
    email: "test#{n + 1}@test.com",
    password: "customer#{n + 1}",
    name: "テスト太郎#{n + 1}"
  )
end
5.times do |n|
  Post.create!(
    content: "content#{n + 1}",
    supplement: "supplement#{n + 1}",
    customer_id: (n + 1).to_s
  )
end

  Customer.create!(
    email: "tester@test.com",
    password: "tester",
    name: "tester"
  )