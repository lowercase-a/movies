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
    render 'show.json.jbuilder'
  end

  def update
    # find the movie i want to update
    the_id = params[:id]
    @movie = Movie.find_by(id: the_id)
    # actually update the movie i want to update
    @movie.runtime = params[:runtime] || @movie.runtime
    @movie.title = params[:title] || @movie.title
    @movie.save
    render 'show.json.jbuilder'
  end

  def destroy
    # find the movie
    the_id = params[:id]
    @movie = Movie.find_by(id: the_id)
    # destroy the movie
    @movie.destroy
    render 'destroy.json.jbuilder'
  end
end
