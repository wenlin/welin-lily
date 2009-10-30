require 'test_helper'

class ErrorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:errors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create errors" do
    assert_difference('Errors.count') do
      post :create, :errors => { }
    end

    assert_redirected_to errors_path(assigns(:errors))
  end

  test "should show errors" do
    get :show, :id => errors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => errors(:one).to_param
    assert_response :success
  end

  test "should update errors" do
    put :update, :id => errors(:one).to_param, :errors => { }
    assert_redirected_to errors_path(assigns(:errors))
  end

  test "should destroy errors" do
    assert_difference('Errors.count', -1) do
      delete :destroy, :id => errors(:one).to_param
    end

    assert_redirected_to errors_path
  end
end
