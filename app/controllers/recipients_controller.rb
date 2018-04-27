class RecipientsController < ApplicationController
  def new
    @recipient = Recipient.new
  end

  def create
    @recipient = Recipient.new(recipient_params)
    @recipient.user_id = current_user.id
    if @recipient.save
      redirect_to user_path(current_user)#change to new_recipient_memento_path
    else
      render :new
    end
  end

private
  def recipient_params
    params.require(:recipient).permit(:name, :email, :relation)
  end

end
