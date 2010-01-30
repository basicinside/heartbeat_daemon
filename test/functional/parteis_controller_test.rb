require 'test_helper'

class ParteisControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parteis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create partei" do
    assert_difference('Partei.count') do
      post :create, :partei => { }
    end

    assert_redirected_to partei_path(assigns(:partei))
  end

  test "should show partei" do
    get :show, :id => parteis(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => parteis(:one).id
    assert_response :success
  end

  test "should update partei" do
    put :update, :id => parteis(:one).id, :partei => { }
    assert_redirected_to partei_path(assigns(:partei))
  end

  test "should destroy partei" do
    assert_difference('Partei.count', -1) do
      delete :destroy, :id => parteis(:one).id
    end

    assert_redirected_to parteis_path
  end
end
