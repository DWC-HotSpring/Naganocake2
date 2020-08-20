class ApplicationController < ActionController::Base
  protected
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:edit, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :prefecture_code, :city, :block, :phone_number])
  end

end
