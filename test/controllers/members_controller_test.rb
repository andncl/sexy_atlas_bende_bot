require "test_helper"

class usersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("user.count") do
      post users_url, params: { user: { balance: @user.balance, first_name: @user.first_name, last_name: @user.last_name, phone_number: @user.phone_number } }
    end

    assert_redirected_to user_url(user.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { balance: @user.balance, first_name: @user.first_name, last_name: @user.last_name, phone_number: @user.phone_number } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference("user.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
