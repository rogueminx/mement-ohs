class CollectionsController < ApplicationController
  before_action :authenticate_user!, :only => [:new]

  def index
    @collection = Collection.all
  end

  def show
    @collection = Collection.find(params[:id])
    @mementos = @collection.mementos
  end

  def new
    @user = current_user
    @collection = Collection.new
    @collection = @user.collection
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user_id = current_user.id
    if @collection.save
      redirect_to new_collection_memento_path(@collection)
    else
      render :new
    end
  end

private
  def collection_params
    params.require(:collection).permit(:title)
  end

end
