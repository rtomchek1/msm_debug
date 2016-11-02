class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new_form
  end

  def create_row
    new_movie = Movie.new
    new_movie.title = params[:title]
    new_movie.year = params[:year]
    new_movie.duration = params[:duration]
    new_movie.description = params[:description]
    new_movie.image_url = params[:image_url]
    new_movie.director_id = params[:director_id]
    new_movie.save

    @movie = new_movie

    render("show")
  end

  def edit_form
    @movie = Movie.find(params[:id])
  end

  def update_row
    movie_update = Movie.find(params[:id])
    movie_update.title = params[:title]
    movie_update.year = params[:year]
    movie_update.duration = params[:duration]
    movie_update.description = params[:description]
    movie_update.image_url = params[:image_url]
    movie_update.director_id = params[:director_id]
    movie_update.save
    
    @movie = movie_update

    render("show")
  end

  def destroy
    @movie_title = Movie.find(params[:id]).title
    movie = Movie.find(params[:id])
    movie.destroy
  end
end
