class CollectionsController < ApplicationController
  before_action :authenticate_user!, :only => [:new]

  def index
    @user = current_user
    @collections = @user.collections
  end

  def show
    @collection = Collection.find(params[:id])
    @mementos = @collection.mementos
    @invite = Invite.new
  end

  def new
    @user = current_user
    @collection = Collection.new
    @collections = @user.collections
  end

  def create
    @collection = Collection.new(collection_params)
    current_user.collections.push(@collection)
    if current_user.save!
      redirect_to new_collection_memento_path(@collection)
    else
      render :new
    end
  end

  def edit
    @user = current_user
    @invite = Invite.new
    @collection = Collection.find(params[:id])
  end

private
  def collection_params
    params.require(:collection).permit(:title)
  end

  def invite_params
    params.require(:invite).permit(:email)
  end

end
