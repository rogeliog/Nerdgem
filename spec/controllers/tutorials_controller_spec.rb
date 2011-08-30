
require 'spec_helper'

describe TutorialsController do
  before do
    # @user = Factory(:user, :email=>"elnuebo@nossd.com")
    # controller.stub(:current_user).and_return(@user)
    @tutorial = Factory(:tutorial)
  end

  describe '#index' do
    before do
      Factory(:tutorial)
    end
    it 'Gets all the tutorials' do
      get 'index'
      assigns(:tutorials).should eql(Tutorial.all)
    end
  end

  describe '#show' do
    context 'With valid params' do
      let(:valid_params){{:id=>@tutorial.id}}

      it 'Gets the tutorial' do
        get 'show', valid_params
        assigns(:tutorial).should eql(@tutorial)
      end
    end

    context 'With invalid params' do
      let(:invalid_params){{:id=>nil}}

      it 'Raise an error' do
        lambda { get 'show', invalid_params}.should raise_error
      end
    end
  end

  describe '#new' do
    it 'Creates a new tutorials variable' do
      get 'new'
      assigns(:tutorial).should be_new_record
    end
  end

  describe '#create' do

    context 'With valid params' do
      let(:valid_params){{:tutorial=>Factory.build(:tutorial).attributes}}

      it 'Gets the tutorial' do
        post 'create', valid_params
        assigns(:tutorial).should be_present
      end
      it 'Saves the tutorial' do
        lambda {post 'create', valid_params}.should change(Tutorial, :count).by(1)
      end

      it 'Redirects to the tutrial show page' do
        post 'create', valid_params
        response.should redirect_to(Tutorial.last)
      end
      it 'Renders a flahs notice for success' do
        post 'create', valid_params
        flash[:notice].should_not be_blank
      end
    end

    context 'With invalid params' do
      let(:invalid_params){{:tutorial => Factory.build(:tutorial, :title=> nil).attributes }}

      it 'Does not saves the tutorial' do
        lambda {post 'create', invalid_params}.should_not change(Tutorial, :count)
      end
      it 'Rendes the new action' do
        post 'create', invalid_params
        response.should render_template('new')
      end

    end
  end

  describe '#edit' do

    context 'With valid params' do
      it 'Gets the tutorial' do
        get 'edit', :id => @tutorial.id
        assigns(:tutorial).should eql(@tutorial)
      end
    end
    context 'With invalid params' do
      it 'Raise an error' do
        lambda { get 'show', :id => nil}.should raise_error
      end
    end
  end
end
