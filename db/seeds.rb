# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Nate Lipp",
             email: "nateplipp@gmail.com",
             github: "github.com/Nalipp",
             twitter: "twitter.com/nateplipp",
             password:              "password",
             password_confirmation: "password",
             admin: "true")

Post.create!(title: "Add upvotes with acts as votable gem",
             description: "I was able to add upvote and downvote with the votable
                        gem but would like to learn more about using it with AJAX",
             link: "https://github.com/Nalipp/Share-my-code",
             user_id: "1",
)

5.times do |n|
  name  = Faker::Name.name
  email = Faker::Internet.free_email
  password = "password"

  User.create!(name:  name,
               email: email,
               github: "github.com",
               password:              password,
               password_confirmation: password)
end

10.times do |n|
  name  = Faker::Name.name
  email = Faker::Internet.free_email
  password = "password"

  User.create!(name:  name,
               email: email,
               github: "github.com",
               twitter: "twitter.com",
               password:              password,
               password_confirmation: password)
end

5.times do |n|
  name  = Faker::Name.name
  email = Faker::Internet.free_email
  password = "password"

  User.create!(name:  name,
               email: email,
               twitter: "twitter.com",
               password:              password,
               password_confirmation: password)
end

30.times do |n|
  title = Faker::Hipster.word
  description = Faker::Hipster.sentence
  user_id = (rand(1..20))

  Post.create!(title: title,
               description: description,
               link: "github.com",
               user_id: user_id)
end
