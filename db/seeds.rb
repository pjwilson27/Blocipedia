require 'faker'

10.times do
    User.create!(
        email: Faker::Internet.email,
        password: Faker::Internet.password(6),
        role: Faker::Number.between(0,2),
        confirmed_at: Time.now
    )
end

20.times do
    Wiki.create!(
        title: Faker::GameOfThrones.character,
        body: Faker::Hipster.paragraph
    )
end
    
puts "#{User.count} new users created"
puts "#{Wiki.count} new wikis created"