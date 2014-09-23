class CollectionsController < ApplicationController
  def index
    @collections = Collection.all
    authorize @collections
  end

  def show
    @collection = Collection.find(params[:id])
  end

  def new
    @collection = Collection.new
    authorize @collection
  end

  def create
    @collection = current_user.collections.build(collection_params)
    authorize @collection
    if @collection.save
      flash[:notice] = "Collection was saved."
      redirect_to @collection
    else
      flash[:error] = "Title can not be left blank."
      render :new
    end
  end

  def edit
    @collection = Collection.find(params[:id])
    authorize @collection
  end

  def update
    @collection = Collection.find(params[:id])
    authorize @collection
    if @collection.update_attributes(collection_params)
      flash[:notice] = "Collection was updated."
      redirect_to @collection
    else
      flash[:error] = "There was an error saving the collection. Please try again."
      render :edit
    end
  end

  def destroy
    @collection = Collection.find(params[:id])
    authorize @collection
    name = @collection.title
    if @collection.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to collections_path
    else
      flash[:error] = "There was an error deleting the collection."
      render :show
    end
  end

  private

  def collection_params
    params.require(:collection).permit(:title)
  end
end
