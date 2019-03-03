class Api::MoviesController < ApplicationController
  def index
    # show all the movies from the database
    @movies = Movie.all
    render 'index.json.jbuilder'
  end

  def show
    # show one particular movie from the database
    the_id = params[:id]
    @movie = Movie.find_by(id: the_id)
    render 'show.json.jbuilder'
  end

  def create
    # make a new movie in the database
    @movie = Movie.new(
      title: params[:input_title],
      runtime: params[:input_runtime]
    )
    @movie.save
    render 'create.json.jbuilder'
  end
end
