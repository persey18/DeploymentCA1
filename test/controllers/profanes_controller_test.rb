require 'test_helper'

class ProfanesControllerTest < ActionController::TestCase
  setup do
    @profane = profanes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profanes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profane" do
    assert_difference('Profane.count') do
      post :create, profane: { text: @profane.text }
    end

    assert_redirected_to profane_path(assigns(:profane))
  end

  test "should show profane" do
    get :show, id: @profane
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profane
    assert_response :success
  end

  test "should update profane" do
    patch :update, id: @profane, profane: { text: @profane.text }
    assert_redirected_to profane_path(assigns(:profane))
  end

  test "should destroy profane" do
    assert_difference('Profane.count', -1) do
      delete :destroy, id: @profane
    end

    assert_redirected_to profanes_path
  end
end
