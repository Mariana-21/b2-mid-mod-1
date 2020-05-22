class MoviesController < ApplicationController

  def show 
    @movie = Movie.find(params[:id])
    @movie.actors.order(:age)
  end
end