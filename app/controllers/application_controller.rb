class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_collections
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_collections
    if current_user
      @user = current_user
      @collections = @user.collections
    end
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :accept_invitation, keys: [:email]
  end
end
