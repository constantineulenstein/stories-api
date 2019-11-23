# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  story = Story.create(name: Faker::GreekPhilosophers.name, text: Faker::GreekPhilosophers.quote)
  3.times do
    Comment.create(name: Faker::FunnyName.name, content: Faker::Hipster.sentence, story_id: story.id)
  end
end

