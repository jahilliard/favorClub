require 'test_helper'

class AddressUsersControllerTest < ActionController::TestCase
  setup do
    @address_user = address_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:address_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create address_user" do
    assert_difference('AddressUser.count') do
      post :create, address_user: { address_id: @address_user.address_id, user_id: @address_user.user_id }
    end

    assert_redirected_to address_user_path(assigns(:address_user))
  end

  test "should show address_user" do
    get :show, id: @address_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @address_user
    assert_response :success
  end

  test "should update address_user" do
    patch :update, id: @address_user, address_user: { address_id: @address_user.address_id, user_id: @address_user.user_id }
    assert_redirected_to address_user_path(assigns(:address_user))
  end

  test "should destroy address_user" do
    assert_difference('AddressUser.count', -1) do
      delete :destroy, id: @address_user
    end

    assert_redirected_to address_users_path
  end
end
