class CollectionsController < ApplicationController
  include DeviseInvitable::Inviter
  before_action :authenticate_user!, :only => [:new]

  def index
    @user = current_user
    @collections = @user.collections
  end

  def show
    @collection = Collection.find(params[:id])
    @mementos = @collection.mementos
    @users = User.all
    @user = current_user
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
      flash[:alert] = "There was a problem updating #{@collection.title}."
      render :edit
    end
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy
    redirect_to user_collections_path(current_user)
  end

  def invite
    @user = User.find_by(invite_params)
    @collection = Collection.find(params[:collection_id])
    if @user != nil
      binding.pry
      Membership.create({user_id: @user.id, collection_id: @collection.id})
      flash[:notice] = "Yay! Invitation was to #{@user.email}!"
      #sendestablisheduserinvite
    else
      #sendnewuserinvitemailer
      flash[:notice] = "NOT A USER. Invitation was sent to #{@user.email}!"
      redirect_to user_collections_path(current_user)
    end
  end

private
  def collection_params
    params.require(:collection).permit(:title)
  end

  def invite_params
    params.require(:user).permit(:email)
  end

end
