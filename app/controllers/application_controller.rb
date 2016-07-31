class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  	added_attrs = [:first_name, :last_name, :profile_name]
  	devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
  end

  def authenticate_user_custom!
    if user_signed_in?
      authenticate_user!
    else
      redirect_to login_path, :alert => 'You need to log in before you can do that!'
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end

end


