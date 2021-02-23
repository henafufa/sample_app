# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create a main sample user.
User.create!(name: "Example User",
    email: "example@railstutorial.org",
    password: "foobar",
    password_confirmation: "foobar",
    admin: true,
    activated: true,
    activated_at: Time.zone.now)
    
# Generate a bunch of additional users.
99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now)
end

# Generate microposts for a subset of users.
users = User.order(:created_at).take(6)
50.times do
    content = Faker::Lorem.sentence(word_count: 5)
    users.each { |user| user.microposts.create!(content:
    content) }
end

# Create following relationships.
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

#create comment relationships
content = Faker::Lorem.sentence(word_count: 5)
 users= User.all
 microposts = Micropost.all
 user_commenter= users[1..5]
 micropost_commenter = microposts[2..20]
 user_commenter.each do |user|
    micropost_commenter.each do |micropost|
        user.comments.create!(content: content, micropost_id: micropost.id )
    end
 end

#  create like relationships
users= User.all
microposts= Micropost.all
user_like= users[1..8]
micropost_liked= microposts[4..20]
user_like.each do |user|
   micropost_liked.each do |micropost|
    user.reactions.create!(micropost_id: micropost.id)       
   end 
end