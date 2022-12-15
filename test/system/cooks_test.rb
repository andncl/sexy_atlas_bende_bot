require "application_system_test_case"

class CooksTest < ApplicationSystemTestCase
  setup do
    @cook = cooks(:one)
  end

  test "visiting the index" do
    visit cooks_url
    assert_selector "h1", text: "Cooks"
  end

  test "should create cook" do
    visit cooks_url
    click_on "New cook"

    fill_in "First name", with: @cook.first_name
    fill_in "Meal", with: @cook.meal_id
    click_on "Create Cook"

    assert_text "Cook was successfully created"
    click_on "Back"
  end

  test "should update Cook" do
    visit cook_url(@cook)
    click_on "Edit this cook", match: :first

    fill_in "First name", with: @cook.first_name
    fill_in "Meal", with: @cook.meal_id
    click_on "Update Cook"

    assert_text "Cook was successfully updated"
    click_on "Back"
  end

  test "should destroy Cook" do
    visit cook_url(@cook)
    click_on "Destroy this cook", match: :first

    assert_text "Cook was successfully destroyed"
  end
end
