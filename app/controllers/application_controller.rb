class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :speciality, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :speciality, :email, :password, bank_attributes: [:bank_name, :bank_account]])
  end

  def after_sign_in_path_for(resource)
    puts "name : #{resource.inspect}"
      if resource.class == Doctor
        puts current_doctor.inspect
        puts "id: #{current_doctor.id}"
        root_path(current_doctor)
      elsif resource.class == User
        puts current_user.inspect
        puts "id: #{current_user.id}"
        root_path(current_user)
      else
        admin_dashboard_path
      end
  end
end
