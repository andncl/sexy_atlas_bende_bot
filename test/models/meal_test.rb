require "test_helper"

class MealTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @meal = create(:meal)
    @user1 = create(:user)
    @user2 = create(:user)
  end

  test 'generate_meal_overview' do
    eater1 = create(:eater, user: @user1, meal: @meal, first_name: 'tobi')
    eater2 = create(:eater, user: @user2, meal: @meal, first_name: 'jens')
    @meal.update(cook_id: @user1.id)

    assert_includes @meal.generate_meal_overview, 'is cooking'
  end
end
