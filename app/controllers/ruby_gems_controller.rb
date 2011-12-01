class RubyGemsController < ApplicationController
  def show
    @ruby_gem  = RubyGem.find (params[:id])
    @ruby_gem.get_info
  end
end
