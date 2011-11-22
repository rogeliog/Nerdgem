class TutorialsController < ApplicationController

  load_and_authorize_resource :except => [:find]
  def index
    @tutorials = Tutorial.ordered
  end

  def show
    @tutorial = Tutorial.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render :text => @tutorial.to_json(:methods =>[:ruby_gems, :markdown_body])}
    end
  end

  def new
    @tutorial = Tutorial.new
  end

  def create
    @tutorial = Tutorial.new(params[:tutorial])
    if @tutorial.save
      redirect_to @tutorial, :notice => "Successfully created tutorial."
    else
      render :action => 'new'
    end
  end
  
  def find
    @users = User.search(params[:q]).limit(20)
    @tutorials = Tutorial.search(params[:q]).limit(20)
    @ruby_gems = RubyGem.search(params[:q]).limit(20)
    @array = [@tutorials, @users, @ruby_gems]
  end

  def edit
    @tutorial = Tutorial.find(params[:id])
  end

  def update
    @tutorial = Tutorial.find(params[:id])
    if @tutorial.update_attributes(params[:tutorial])
      redirect_to @tutorial, :notice  => "Successfully updated tutorial."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @tutorial = Tutorial.find(params[:id])
    @tutorial.destroy
    redirect_to tutorials_url, :notice => "Successfully destroyed tutorial."
  end
end
