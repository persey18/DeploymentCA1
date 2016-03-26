require 'test_helper'

class PrimesControllerTest < ActionController::TestCase
  setup do
    @prime = primes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:primes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prime" do
    assert_difference('Prime.count') do
      post :create, prime: { primenum: @prime.primenum }
    end

    assert_redirected_to prime_path(assigns(:prime))
  end

  test "should show prime" do
    get :show, id: @prime
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prime
    assert_response :success
  end

  test "should update prime" do
    patch :update, id: @prime, prime: { primenum: @prime.primenum }
    assert_redirected_to prime_path(assigns(:prime))
  end

  test "should destroy prime" do
    assert_difference('Prime.count', -1) do
      delete :destroy, id: @prime
    end

    assert_redirected_to primes_path
  end
end
