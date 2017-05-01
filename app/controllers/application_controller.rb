class ApplicationController < ActionController::Base

 before_filter :configure_permitted_parameters, if: :devise_controller?

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,
     :phone_number, :commute_one_start, :commute_one_end, :commute_two_start,
     :commute_two_end])
 end
end
