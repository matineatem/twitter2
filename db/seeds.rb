# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Tweet.destroy_all
Like.destroy_all

10.times do  User.create(name: Faker::TvShows::BigBangTheory.unique.character, 
    password: Faker::TvShows::GameOfThrones.dragon,
    handle: Faker::TvShows::GameOfThrones.unique.character,
    bio: Faker::TvShows::GameOfThrones.quote,
    birthday: Faker::Date.birthday(min_age: 18, max_age: 65) )
end

10.times do  Tweet.create(text: Faker::TvShows::BigBangTheory.quote,
    user_id: User.all.sample.id)
end

10.times do  Like.create(user_id: User.all.sample.id, 
    tweet_id: Tweet.all.sample.id) 
end
