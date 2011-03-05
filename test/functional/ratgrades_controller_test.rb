require 'test_helper'

class RatgradesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ratgrades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ratgrade" do
    assert_difference('Ratgrade.count') do
      post :create, :ratgrade => { }
    end

    assert_redirected_to ratgrade_path(assigns(:ratgrade))
  end

  test "should show ratgrade" do
    get :show, :id => ratgrades(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ratgrades(:one).to_param
    assert_response :success
  end

  test "should update ratgrade" do
    put :update, :id => ratgrades(:one).to_param, :ratgrade => { }
    assert_redirected_to ratgrade_path(assigns(:ratgrade))
  end

  test "should destroy ratgrade" do
    assert_difference('Ratgrade.count', -1) do
      delete :destroy, :id => ratgrades(:one).to_param
    end

    assert_redirected_to ratgrades_path
  end
end
