class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
    #whitelist the form fields so they can be processed (security feature) if coming from devise sign up form
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    if current_user.profile
      return root_path
    else
      return new_user_profile_path(user_id: current_user.id)
    end
  end
  
protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:stripe_card_token, :email, :password, :password_confirmation) }
  end
end
