class WelcomeController < ApplicationController
  def index
  end

  def about
  end
  
  def hello
    session[:hello] = true
  end
end
