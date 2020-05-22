class StudiosController < ApplicationController

  def index
    @studio = Studio.find(params[:id])

  end
end