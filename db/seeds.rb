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
             password:              "password",
             password_confirmation: "password",
             admin: "true")

Post.create!(title: "Add upvotes with acts as votable gem",
             description: "I was able to add upvote and downvote with the votable
                        gem but would like to learn more about using it with AJAX",
             link: "https://github.com/Nalipp/Share-my-code",
             user_id: "1",
)

20.times do |n|
  name  = Faker::Name.name
  email = Faker::Internet.free_email
  github = "github.com"
  password = "password"

  title = Faker::Hipster.word
  description = Faker::Hipster.sentence
  link = "https://github.com"
  user_id = "#{n+1}"

  User.create!(name:  name,
               email: email,
               github: github,
               password:              password,
               password_confirmation: password)

  Post.create!(title: title,
               description: description,
               link: link,
               user_id: user_id)
end
