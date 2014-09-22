class CollectionsController < ApplicationController
  def index
    @collections = Collection.all
  end

  def show
    @collection = Collection.find(params[:id])
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    if @collection.save
      flash[:notice] = "Collection was saved."
      redirect_to @collection
    else
      flash[:error] = "There was an error saving the Collection. Please try again."
      render :new
    end
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  def update
    @collection = Collection.find(params[:id])
    if @collection.update_attributes(collection_params)
      flash[:notice] = "Collection was updated."
      redirect_to @collection
    else
      flash[:error] = "There was an error saving the collection. Please try again."
      render :edit
    end
  end

  private

  def collection_params
    params.require(:collection).permit(:title)
  end
end
