require 'rails_helper' 

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit the sudio index page" do 
    it "I see a list of all the movie studios and the names of all its movies" do 
      studio1 = Studio.create!(name: "Walt Disney Studios", location: "Burbank,CA")
      studio2 = Studio.create!(name: "Paramount Studios", location: "Los Angeles,CA")
      studio3 = Studio.create!(name: "Santa Clarita Studios", location: "Santa Clarita,CA")

      movie1 = Movie.create!(title: "Mulan", creation_year: "1998", genre: "Kids", studio_id: studio1.id)
      movie2 = Movie.create!(title: "The Lion King", creation_year: "1994", genre: "Kids", studio_id: studio1.id)
      movie3 = Movie.create!(title: "Mission: Impossible", creation_year: "1996", genre: "Action", studio_id: studio2.id)
      movie4 = Movie.create!(title: "Forrest Gump", creation_year: "1994", genre: "Romance", studio_id: studio2.id)
      movie5 = Movie.create!(title: "Fast and Furious 7", creation_year: "2015", genre: "Action", studio_id: studio3.id)

      visit "/studios/#{studio1.id}"

      expect(page).to have_content(studio1.name) 
      expect(page).to have_content(movie1.title) 
      expect(page).to have_content(movie2.title) 
      expect(page).to_not have_content(movie5.title) 

      visit "/studios/#{studio2.id}"

      expect(page).to have_content(studio2.name) 
      expect(page).to have_content(movie3.title) 
      expect(page).to have_content(movie4.title) 
      expect(page).to_not have_content(movie5.title) 
    end
  end
end

# As a visitor,
# When I visit the studio index page
# I see a list of all of the movie studios
# And underneath each studio, I see the names of all of its movies.