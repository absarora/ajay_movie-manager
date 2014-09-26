class MoviesController < ApplicationController

  def show
    find_collection
    @movie = Movie.find(params[:id])
  end

  def new
    find_collection
    @movie = Movie.new
    authorize @movie
  end

  def create
    find_collection
    @movie = @collection.movies.build(movie_params)
    #@movie.collection = @collection
    authorize @movie
    if @movie.save
      flash[:notice] = "Movie was saved."
      redirect_to [@collection, @movie]
    else
      flash[:error] = "There was an error saving the Movie. Please try again."
      render :new
    end
  end

  def edit
    find_collection
    @movie = Movie.find(params[:id])
    authorize @movie
  end

  def update
    find_collection
    @movie = Movie.find(params[:id])
    authorize @movie
    if @movie.update_attributes(movie_params)
      flash[:notice] = "Movie was updated."
      redirect_to [@collection, @movie]
    else
      flash[:error] = "There was an error saving the movie. Please try again."
      render :edit
    end
  end

  def destroy
    find_collection
    @movie = Movie.find(params[:id])
    authorize @movie
    name = @movie.title
    if @movie.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to @collection
    else
      flash[:error] = "There was an error deleting the movie."
      render :show
    end
  end

  def find_collection
    @collection = Collection.find(params[:collection_id])
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :format, :length, :year, :rating)
  end

end
