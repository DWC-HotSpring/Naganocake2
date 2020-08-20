class ApplicationController < ActionController::Base
  protected
 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:edit, keys: [:first_name][:last_name][:first_name_kana][:last_name_kana][:post_code][:number_field][:city][:block][:phone_number])
  end

end
