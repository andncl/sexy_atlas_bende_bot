require "application_system_test_case"

class EatersTest < ApplicationSystemTestCase
  setup do
    @eater = eaters(:one)
  end

  test "visiting the index" do
    visit eaters_url
    assert_selector "h1", text: "Eaters"
  end

  test "should create eater" do
    visit eaters_url
    click_on "New eater"

    fill_in "First name", with: @eater.first_name
    fill_in "Meal", with: @eater.meal_id
    fill_in "user", with: @eater.user_id
    click_on "Create Eater"

    assert_text "Eater was successfully created"
    click_on "Back"
  end

  test "should update Eater" do
    visit eater_url(@eater)
    click_on "Edit this eater", match: :first

    fill_in "First name", with: @eater.first_name
    fill_in "Meal", with: @eater.meal_id
    fill_in "user", with: @eater.user_id
    click_on "Update Eater"

    assert_text "Eater was successfully updated"
    click_on "Back"
  end

  test "should destroy Eater" do
    visit eater_url(@eater)
    click_on "Destroy this eater", match: :first

    assert_text "Eater was successfully destroyed"
  end
end
