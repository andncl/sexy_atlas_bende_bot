require "test_helper"

class EatersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @eater = eaters(:one)
  end

  test "should get index" do
    get eaters_url
    assert_response :success
  end

  test "should get new" do
    get new_eater_url
    assert_response :success
  end

  test "should create eater" do
    assert_difference("Eater.count") do
      post eaters_url, params: { eater: { first_name: @eater.first_name, meal_id: @eater.meal_id, member_id: @eater.member_id } }
    end

    assert_redirected_to eater_url(Eater.last)
  end

  test "should show eater" do
    get eater_url(@eater)
    assert_response :success
  end

  test "should get edit" do
    get edit_eater_url(@eater)
    assert_response :success
  end

  test "should update eater" do
    patch eater_url(@eater), params: { eater: { first_name: @eater.first_name, meal_id: @eater.meal_id, member_id: @eater.member_id } }
    assert_redirected_to eater_url(@eater)
  end

  test "should destroy eater" do
    assert_difference("Eater.count", -1) do
      delete eater_url(@eater)
    end

    assert_redirected_to eaters_url
  end
end
