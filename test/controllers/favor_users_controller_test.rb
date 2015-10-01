require 'test_helper'

class FavorUsersControllerTest < ActionController::TestCase
  setup do
    @favor_user = favor_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:favor_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create favor_user" do
    assert_difference('FavorUser.count') do
      post :create, favor_user: { favor_id: @favor_user.favor_id, notes: @favor_user.notes, role: @favor_user.role, user_id: @favor_user.user_id }
    end

    assert_redirected_to favor_user_path(assigns(:favor_user))
  end

  test "should show favor_user" do
    get :show, id: @favor_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @favor_user
    assert_response :success
  end

  test "should update favor_user" do
    patch :update, id: @favor_user, favor_user: { favor_id: @favor_user.favor_id, notes: @favor_user.notes, role: @favor_user.role, user_id: @favor_user.user_id }
    assert_redirected_to favor_user_path(assigns(:favor_user))
  end

  test "should destroy favor_user" do
    assert_difference('FavorUser.count', -1) do
      delete :destroy, id: @favor_user
    end

    assert_redirected_to favor_users_path
  end
end
