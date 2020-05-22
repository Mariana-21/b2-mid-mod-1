require 'rails_helper' 

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit a movie page" do 
    it "I see the movie's title, creation year, and genre, and a list of all its actors from youngest to oldest. And I see the average age of all of the movie's actors" do 
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

      MovieActor.create(movie_id: movie1.id, actor_id: actor1.id)
      MovieActor.create(movie_id: movie1.id, actor_id: actor2.id)
      MovieActor.create(movie_id: movie2.id, actor_id: actor3.id)
      MovieActor.create(movie_id: movie2.id, actor_id: actor4.id)
      MovieActor.create(movie_id: movie4.id, actor_id: actor7.id)
      MovieActor.create(movie_id: movie3.id, actor_id: actor5.id)
      MovieActor.create(movie_id: movie3.id, actor_id: actor6.id)

      visit "/movies/#{movie4.id}"

      expect(page).to have_content(movie4.title) 
      expect(page).to have_content(movie4.creation_year) 
      expect(page).to have_content(movie4.genre) 
      expect(page).to have_content(actor7.name) 
      expect(page).to_not have_content(actor1.name) 
      expect(page).to have_content("Average Ages:") 

      visit "/movies/#{movie3.id}"

      expect(page).to have_content(movie3.title) 
      expect(page).to have_content(movie3.creation_year) 
      expect(page).to have_content(movie3.genre) 
      expect(page).to have_content(actor5.name) 
      expect(page).to have_content(actor6.name) 
      expect(page).to_not have_content(actor4.name) 
      expect(page).to have_content("Average Ages:") 
    end
  end
end
