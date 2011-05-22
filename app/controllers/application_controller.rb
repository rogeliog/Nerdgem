class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = 'You are not authorized to access this page.'
    if current_user
      redirect_to root_path
    else
      redirect_to new_user_session_path
    end
  end

end
