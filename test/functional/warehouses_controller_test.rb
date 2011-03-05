require 'test_helper'

class WarehousesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:warehouses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create warehouse" do
    assert_difference('Warehouse.count') do
      post :create, :warehouse => { }
    end

    assert_redirected_to warehouse_path(assigns(:warehouse))
  end

  test "should show warehouse" do
    get :show, :id => warehouses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => warehouses(:one).to_param
    assert_response :success
  end

  test "should update warehouse" do
    put :update, :id => warehouses(:one).to_param, :warehouse => { }
    assert_redirected_to warehouse_path(assigns(:warehouse))
  end

  test "should destroy warehouse" do
    assert_difference('Warehouse.count', -1) do
      delete :destroy, :id => warehouses(:one).to_param
    end

    assert_redirected_to warehouses_path
  end
end
