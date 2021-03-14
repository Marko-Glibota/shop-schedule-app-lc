# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Schedule.destroy_all
Shop.destroy_all

puts 'Creating 10 shops...'

10.times do
  shop = Shop.new(
    name: "#{Faker::Creature::Animal.name} Shop"
  )
  shop.save!
  puts "#{shop.name} created successfully."

  weekdays = 0
  morning_opening_hours = ['8:30:00', '9:00:00', '9:30:00', '10:00:00']
  morning_closing_hours = ['12:30:00', '13:00:00']
  afternoon_opening_hours = ['13:30:00', '14:00:00']
  afternoon_closing_hours = ['18:30:00', '19:00:00', '19:30:00', '20:00:00']

  5.times do
    schedule = Schedule.new(
      weekday: weekdays + 1,
      morning_opening_hour: morning_opening_hours.sample,
      morning_closing_hour: morning_closing_hours.sample,
      afternoon_opening_hour: afternoon_opening_hours.sample,
      afternoon_closing_hour: afternoon_closing_hours.sample,
      shop: shop
    )
    weekdays += 1
    schedule.save!
    puts 'Schedule created successfully.'
  end
  schedule = Schedule.new(
    weekday: 6,
    morning_opening_hour: morning_opening_hours.sample,
    morning_closing_hour: nil,
    afternoon_opening_hour: nil,
    afternoon_closing_hour: afternoon_closing_hours.sample,
    shop: shop
  )
  schedule.save!
  puts 'Saturday schedule created.'

  schedule = Schedule.new(
    weekday: 0,
    morning_opening_hour: nil,
    morning_closing_hour: nil,
    afternoon_opening_hour: nil,
    afternoon_closing_hour: nil,
    shop: shop
  )
  schedule.save!
  puts 'Sunday schedule created.'
end
