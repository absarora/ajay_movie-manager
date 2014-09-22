class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = "Movie was saved."
      redirect_to @movie
    else
      flash[:error] = "There was an error saving the Movie. Please try again."
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(movie_params)
      flash[:notice] = "Movie was updated."
      redirect_to @movie
    else
      flash[:error] = "There was an error saving the movie. Please try again."
      render :edit
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :format, :length, :year, :rating)
  end
end
