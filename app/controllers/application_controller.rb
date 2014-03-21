class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, :with => :not_found
  rescue_from AbstractController::ActionNotFound, :with => :not_found
  rescue_from ActionController::RoutingError, :with => :not_found

  def not_found
  	show_error('Object is not found!')
  end

  def show_error(msg='Object does not exist!')
  	flash[:warning] = msg
  	redirect_to root_path
  end
  
end
