require 'test_helper'

class PreportsControllerTest < ActionController::TestCase
  setup do
    @preport = preports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:preports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create preport" do
    assert_difference('Preport.count') do
      post :create, :preport => @preport.attributes
    end

    assert_redirected_to preport_path(assigns(:preport))
  end

  test "should show preport" do
    get :show, :id => @preport.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @preport.to_param
    assert_response :success
  end

  test "should update preport" do
    put :update, :id => @preport.to_param, :preport => @preport.attributes
    assert_redirected_to preport_path(assigns(:preport))
  end

  test "should destroy preport" do
    assert_difference('Preport.count', -1) do
      delete :destroy, :id => @preport.to_param
    end

    assert_redirected_to preports_path
  end
end
