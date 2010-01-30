require 'test_helper'

class LandesverbandsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:landesverbands)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create landesverband" do
    assert_difference('Landesverband.count') do
      post :create, :landesverband => { }
    end

    assert_redirected_to landesverband_path(assigns(:landesverband))
  end

  test "should show landesverband" do
    get :show, :id => landesverbands(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => landesverbands(:one).id
    assert_response :success
  end

  test "should update landesverband" do
    put :update, :id => landesverbands(:one).id, :landesverband => { }
    assert_redirected_to landesverband_path(assigns(:landesverband))
  end

  test "should destroy landesverband" do
    assert_difference('Landesverband.count', -1) do
      delete :destroy, :id => landesverbands(:one).id
    end

    assert_redirected_to landesverbands_path
  end
end
