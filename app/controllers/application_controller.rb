class ApplicationController < ActionController::Base

def create
  binding.pry
  User.create(user_params)
end

  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
  def user_params
    params.require(:user).permit(:nickname, :email, :encrypted_password, :first_name, :last_name, :first_name_katakana, :last_name_katakana, :birthday)
  end
end
