class ApplicationController < ActionController::Base
  include RansackerTranslator::FormatRansackParameters

  before_action :format_ransack_params
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :number, :admin])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :number, :admin])
  end
end
