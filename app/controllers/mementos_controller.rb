class MementosController < ApplicationController

  def index
    @recipient = Recipient.find(params[:recipient_id])
    @user = current_user
    @mementos = Memento.current_user_mementos(@user.id)
  end

  def all
    render :index
  end

  def show
    @memento = Memento.find(params[:id])
    @recipient = Recipient.find(params[:recipient_id])
  end

  def new
    @recipient = Recipient.find(params[:recipient_id])
    @memento = Memento.new
  end

  def create
    @recipient = Recipient.find(params[:recipient_id])
    @memento = Memento.new(memento_params)
    @memento.user_id = current_user.id
    @memento.recipient_id = @recipient.id
    if @memento.save
      redirect_to recipient_mementos_path(@recipient.id)
    else
      render :new
    end
  end

  def edit
    @recipient = Recipient.find(params[:recipient_id])
    @memento = Memento.find(params[:id])
  end

 def update
   @memento = Memento.find(params[:id])
   @recipient = Recipient.find(params[:recipient_id])
   binding.pry
   if @memento.update!(memento_params)
     redirect_to recipient_memento_path(@recipient, @memento)
   else
     render :edit
   end
 end

 def destroy
   @memento = Memento.find(params[:id])
   @memento.destroy
   redirect_to mementos_path
 end


private
  def memento_params
    params.require(:memento).permit(:title, :body, :time_to_send, :image)
  end
end
