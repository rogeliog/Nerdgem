class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = 'You are not authorized to access this page.'
      redirect_to root_path
  end

end
