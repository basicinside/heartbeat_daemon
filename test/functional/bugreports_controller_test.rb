require 'test_helper'

class BugreportsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bugreports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bugreport" do
    assert_difference('Bugreport.count') do
      post :create, :bugreport => { }
    end

    assert_redirected_to bugreport_path(assigns(:bugreport))
  end

  test "should show bugreport" do
    get :show, :id => bugreports(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => bugreports(:one).to_param
    assert_response :success
  end

  test "should update bugreport" do
    put :update, :id => bugreports(:one).to_param, :bugreport => { }
    assert_redirected_to bugreport_path(assigns(:bugreport))
  end

  test "should destroy bugreport" do
    assert_difference('Bugreport.count', -1) do
      delete :destroy, :id => bugreports(:one).to_param
    end

    assert_redirected_to bugreports_path
  end
end
