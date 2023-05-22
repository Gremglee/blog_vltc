class ApplicationController < ActionController::Base
  before_action :configure_sign_up_params, only: [:create], if: :devise_controller?
  before_action :authenticate_user!

  include Pagy::Backend
  include Pundit::Authorization

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
