class InvitesController < ApplicationController
  def create
    @invite = Invite.new(invite_params)
    @invite.sender_id = current_user.id
    if @invite.save
       flash[:notice] = "Invite was created."
       UserMailer.new_user_invite(@invite, new_user_registration_path(:invite_token => @invite.token)).deliver
    else
      flash[:notice] = "Invite couldn't be created."
    end
  end

private
  def invite_params
    params.require(:invite).permit(:email)
  end
end
