class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
    	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
      # Allow edit without password + registraitions controller
    	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password)}
    end

  # require 'ostruct'

  # helper_method :current_user

  # def current_user
  # 	@current_user ||= User.find session[:user_id] if session[:user_id]
  # 	if @current_user
  # 		@current_user
  # 	else
  # 		OpenStruct.new(name: 'Guest')
  # 	end
  # end

end
