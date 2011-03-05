require 'test_helper'

class PnotesControllerTest < ActionController::TestCase
  setup do
    @pnote = pnotes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pnotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pnote" do
    assert_difference('Pnote.count') do
      post :create, :pnote => @pnote.attributes
    end

    assert_redirected_to pnote_path(assigns(:pnote))
  end

  test "should show pnote" do
    get :show, :id => @pnote.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @pnote.to_param
    assert_response :success
  end

  test "should update pnote" do
    put :update, :id => @pnote.to_param, :pnote => @pnote.attributes
    assert_redirected_to pnote_path(assigns(:pnote))
  end

  test "should destroy pnote" do
    assert_difference('Pnote.count', -1) do
      delete :destroy, :id => @pnote.to_param
    end

    assert_redirected_to pnotes_path
  end
end
