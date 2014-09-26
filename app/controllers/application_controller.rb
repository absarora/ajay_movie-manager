class ApplicationController < ActionController::Base
  #before_action :authenticate_user!
  include Pundit
  include CollectionsHelper
  include MoviesHelper
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError do |exception|
    redirect_to root_url, alert: exception.message
  end
 
  protected
 
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
