class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :ensure_domain

  APP_DOMAIN = 'www.nerdgem.com'

  def ensure_domain
    if Rails.env.production? && request.env['HTTP_HOST'] != APP_DOMAIN
      # HTTP 301 is a "permanent" redirect
      redirect_to "http://#{APP_DOMAIN}", :status => 301
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = 'You are not authorized to access this page.'
    redirect_to root_path
  end


end
