# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


studio1 = Studio.create!(name: "Walt Disney Studios", location: "Burbank,CA")
studio2 = Studio.create!(name: "Paramount Studios", location: "Los Angeles,CA")
studio3 = Studio.create!(name: "Santa Clarita Studios", location: "Santa Clarita,CA")

movie1 = Movie.create!(title: "Mulan", creation_year: "1998", genre: "Kids", studio_id: studio1.id)
movie2 = Movie.create!(title: "The Lion King", creation_year: "1994", genre: "Kids", studio_id: studio1.id)
movie3 = Movie.create!(title: "Mission: Impossible", creation_year: "1996", genre: "Action", studio_id: studio2.id)
movie4 = Movie.create!(title: "Forrest Gump", creation_year: "1994", genre: "Romance", studio_id: studio2.id)
movie5 = Movie.create!(title: "Fast and Furious 7", creation_year: "2015", genre: "Action", studio_id: studio3.id)

actor1 = Actor.create(name: "Ming-Na Wen", age: "56")
actor2 = Actor.create(name: "BD Wong", age: "59")
actor3 = Actor.create(name: "Donald Glover", age: "36")
actor4 = Actor.create(name: "James Earl Jones", age: "89")
actor5 = Actor.create(name: "Tom Cruise", age: "57")
actor6 = Actor.create(name: "Vanessa Kirby", age: "32")
actor7 = Actor.create(name: "Tom Hanks", age: "63")
actor8 = Actor.create(name: "Vin Diesel", age: "52")

