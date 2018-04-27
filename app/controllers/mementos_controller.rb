class MementosController < ApplicationController
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
      redirect_to mementos_path(current_user)
    else
      render :new
    end
  end

private
  def memento_params
    params.require(:memento).permit(:title, :body, :time_to_send)
  end
end
