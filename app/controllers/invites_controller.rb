class InvitesController < ApplicationController

  def create
    @invite = Invite.new(invite_params)
    @invite.sender_id = current_user.id
    collection_id = @invite.collection_id
    @collection = Collection.find(collection_id)
    
    if @invite.save
       UserMailer.new_user_invitation(@invite, new_user_registration_path(:invite_token => @invite.token)).deliver
       flash[:alert] = "Invitation sent!"
       redirect_to user_collection_path(current_user, @collection)
    else
       flash[:alert] = "There was a problem with adding that e-mail."
       redirect_to user_collection_path(current_user, @collection)
    end
 end

  def edit
  end

  def update
  end

  private
  def invite_params
    params.require(:invite).permit(:email, :collection_id)
  end

end
