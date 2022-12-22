require "application_system_test_case"

class usersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "users"
  end

  test "should create user" do
    visit users_url
    click_on "New user"

    fill_in "Balance", with: @user.balance
    fill_in "First name", with: @user.first_name
    fill_in "Last name", with: @user.last_name
    fill_in "Phone number", with: @user.phone_number
    click_on "Create user"

    assert_text "user was successfully created"
    click_on "Back"
  end

  test "should update user" do
    visit user_url(@user)
    click_on "Edit this user", match: :first

    fill_in "Balance", with: @user.balance
    fill_in "First name", with: @user.first_name
    fill_in "Last name", with: @user.last_name
    fill_in "Phone number", with: @user.phone_number
    click_on "Update user"

    assert_text "user was successfully updated"
    click_on "Back"
  end

  test "should destroy user" do
    visit user_url(@user)
    click_on "Destroy this user", match: :first

    assert_text "user was successfully destroyed"
  end
end
