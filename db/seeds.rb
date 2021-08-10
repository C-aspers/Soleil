# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'activerecord-reset-pk-sequence'

User.destroy_all
User.reset_pk_sequence
Event.destroy_all
Event.reset_pk_sequence
Attendance.destroy_all
Attendance.reset_pk_sequence



#for the random id
#user_rdm = rand(User.first.id..User.last.id)

1.times do
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence, email: Faker::Name.first_name+"@yopmail.com", encrypted_password: Faker::Lorem.characters(number: 12, min_alpha: 4, min_numeric: 2))
  #puts "c'est OK"
end

#for the random startdate
t1 = Time.parse("2021-09-01 00:00:00")
t2 = Time.parse("2022-01-01 00:00:00")
#for the random id
#user_rdm = rand(User.first.id..User.last.id)

5.times do 
  event = Event.create!(
    start_date: rand(t1..t2),
    duration: rand(5..100)*5,
    description: Faker::Lorem.characters(number: 21),
    location: Faker::Address.city,
    price: rand(1..1000),
    title: Faker::Book.title,
    user_id: rand(User.first.id..User.last.id))
  puts "OUIIIII, ça MARCHE !!!".red
end


5.times do
  Attendance.create(
    user_id: rand(User.first.id..User.last.id),
    event_id: rand(Event.first.id..Event.last.id),
    stripe_customer_id: Faker::Stripe.valid_card)
  puts "OUIIIII, ça MARCHE encore!!!".blue
end

