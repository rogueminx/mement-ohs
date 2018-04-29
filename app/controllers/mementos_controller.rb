class MementosController < ApplicationController

  def index
    @recipient = Recipient.find(params[:recipient_id])
    @user = current_user
    @mementos = Memento.current_user_mementos(@user.id)
  end

  def show
    @memento = Memento.find(params[:id])
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
      binding.pry
      redirect_to  recipient_mementos_path(@recipient.id)
    else
      render :new
    end
  end


private
  def memento_params
    params.require(:memento).permit(:title, :body, :time_to_send, :image)
  end
end
