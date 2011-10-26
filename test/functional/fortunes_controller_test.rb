require 'test_helper'

class FortunesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Fortune.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Fortune.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Fortune.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to fortune_url(assigns(:fortune))
  end

  def test_edit
    get :edit, :id => Fortune.first
    assert_template 'edit'
  end

  def test_update_invalid
    Fortune.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Fortune.first
    assert_template 'edit'
  end

  def test_update_valid
    Fortune.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Fortune.first
    assert_redirected_to fortune_url(assigns(:fortune))
  end

  def test_destroy
    fortune = Fortune.first
    delete :destroy, :id => fortune
    assert_redirected_to fortunes_url
    assert !Fortune.exists?(fortune.id)
  end
end
