class TutorialsController < ApplicationController
  load_and_authorize_resource :through => :current_user

  def index
    @tutorials = Tutorial.all
  end

  def show
    @tutorial = Tutorial.find(params[:id])
  end

  def new
    @tutorial = Tutorial.new
  end

  def create
    @tutorial = Tutorial.new(params[:tutorial])
    @tutorial.user_id = current_user.id
    if @tutorial.save
      redirect_to @tutorial, :notice => "Successfully created tutorial."
    else
      render :action => 'new'
    end
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
