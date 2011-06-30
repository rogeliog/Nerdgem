class TutorialsController < ApplicationController
  load_and_authorize_resource :through => :current_user, :except=>[:index,:show]

  def index
    @tutorials = Tutorial.all
  end

  def show
    @tutorial = Tutorial.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render :text => @tutorial.to_json(:methods =>[:ruby_gems, :markdown_body])}
    end
  end

  def new
  end

  def create
    if @tutorial.save
      redirect_to @tutorial, :notice => "Successfully created tutorial."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @tutorial.update_attributes(params[:tutorial])
      redirect_to @tutorial, :notice  => "Successfully updated tutorial."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @tutorial.destroy
    redirect_to tutorials_url, :notice => "Successfully destroyed tutorial."
  end
end
