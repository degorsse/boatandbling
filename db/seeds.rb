# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

Harbour.delete_all
  cities = ["Saint Tropez", "Monaco", "Miami", "Florida", "Nice", "Brest", "Concarneau", "San Francisco", "Barcelona",
    "Oslo"]
  names = [" Harbour", "- Le Port", " Yachting Club", "Marina", "Bay"]
cities.each_with_index do |x, index|

  harbour = Harbour.create(name:Faker::Lorem.word.capitalize+names.sample, address:Faker::Address.street_address,
  city:cities[index])
end

Boat.delete_all
boats = ["La Vénus de Malo", "La jaconde", "Nymphéos",
  "Jeune Folle à la perle", "Altaïr", "Corvette", "Amistad", "Amoco Cadiz", "Allure of the Seas",
"Alinghi"]
sizes= [12,23,34,45,56,67,78]
capacities= [4,6,8,10,12,24]
prices= [110,230,345,456,567,678,789]
boats.each_with_index do |x, index|
  random_size=sizes.sample
  b= Boat.create(name:boats[index]+" #{random_size}", size:random_size, capacity:capacities.sample, price_per_day:prices.sample, description:Faker::Lorem.paragraph(2, true))
end

