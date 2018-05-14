class MementosController < ApplicationController

  def index
    @collection = Collection.find(params[:collection_id])
    @user = current_user
    @mementos = Memento.current_user_mementos(@user.id)
  end

  def all
    render :index
  end

  def show
    @memento = Memento.find(params[:id])
    @collection = Collection.find(params[:collection_id])
  end

  def new
    @collection = Collection.find(params[:collection_id])
    @memento = Memento.new
  end

  def create
    @collection = Collection.find(params[:collection_id])
    @memento = Memento.new(memento_params)
    @memento.user_id = current_user.id
    @memento.collection_id = @collection.id
    if @memento.save
      redirect_to collection_mementos_path(@collection.id)
    else
      render :new
    end
  end

  def edit
    @collection = Collection.find(params[:collection_id])
    @memento = Memento.find(params[:id])
  end

 def update
   @memento = Memento.find(params[:id])
   @collection = Collection.find(params[:collection_id])
   if @memento.update!(memento_params)
     redirect_to collection_memento_path(@collection, @memento)
   else
     render :edit
   end
 end

 def destroy
   @collection = Collection.find(params[:collection_id])
   @memento = Memento.find(params[:id])
   @memento.destroy
   redirect_to collection_mementos_path(@collection)
 end


private
  def memento_params
    params.require(:memento).permit(:title, :body, :time_to_send, :image)
  end
end
