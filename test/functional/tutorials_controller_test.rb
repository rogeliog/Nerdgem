require 'test_helper'

class TutorialsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Tutorial.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Tutorial.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Tutorial.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to tutorial_url(assigns(:tutorial))
  end

  def test_edit
    get :edit, :id => Tutorial.first
    assert_template 'edit'
  end

  def test_update_invalid
    Tutorial.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Tutorial.first
    assert_template 'edit'
  end

  def test_update_valid
    Tutorial.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Tutorial.first
    assert_redirected_to tutorial_url(assigns(:tutorial))
  end

  def test_destroy
    tutorial = Tutorial.first
    delete :destroy, :id => tutorial
    assert_redirected_to tutorials_url
    assert !Tutorial.exists?(tutorial.id)
  end
end
