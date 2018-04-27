class RecipientsController < ApplicationController
  before_action :authenticate_user!, :only => [:new]

  def new
    @recipient = Recipient.new
  end

  def create
    @recipient = Recipient.new(recipient_params)
    @recipient.user_id = current_user.id
    if @recipient.save
      redirect_to new_recipient_memento_path(@recipient)
    else
      render :new
    end
  end

private
  def recipient_params
    params.require(:recipient).permit(:name, :email, :relation)
  end

end
