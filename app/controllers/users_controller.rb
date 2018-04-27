class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def memento
    @user = current_user
    @mementos = Memento.current_user_mementos(@user.id)
  end
end
