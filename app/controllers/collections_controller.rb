class CollectionsController < ApplicationController
  before_action :authenticate_user!, :only => [:new]

  def index
    @user = current_user
    @collections = @user.collections
  end

  def show
    @collection = Collection.find(params[:id])
    @mementos = @collection.mementos
  end

  def new
    @user = current_user
    @collection = Collection.new
    @collections = @user.collections
  end

  def create
    @collection = Collection.new(collection_params)
    current_user.collections.push(@collection)
    Collection.create_owner(@collection)
    if current_user.save!
      redirect_to new_collection_memento_path(@collection)
    else
      render :new
    end
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  def update
    @collection = Collection.find(params[:id])
    if @collection.update!(collection_params)
      flash[:notice] = "#{@collection.title} was a
      updated."
      redirect_to user_collections_path(current_user)
    else
      flash[:alert] = "There was a proble updating #{@collection.title}."
      render :edit
    end
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy
    redirect_to user_collections_path(current_user)
  end

private
  def collection_params
    params.require(:collection).permit(:title)
  end

  def invite_params
    params.require(:invite).permit(:email)
  end

end
