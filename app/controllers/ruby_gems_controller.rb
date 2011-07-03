class RubyGemsController < ApplicationController
  def index
    @ruby_gems = RubyGem.where("name like ?", "#{params[:q]}%").order("name")
    respond_to do |format|
      format.html
      format.json { render :json => @ruby_gems.map(&:attributes) }
    end    
  end
  
  def show
    @ruby_gem  = RubyGem.find (params[:id])
  end
end
