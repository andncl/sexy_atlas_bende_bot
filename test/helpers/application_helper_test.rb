require "test_helper"

class ApplicationHelperTest < ActiveSupport::TestCase
	def setup
		Current.user = build(:user, :called_hans)
		@meal = create(:meal)
		@eater = create(
			:eater,
			:is_cook,
			meal: @meal, 
			user: Current.user,
		)

	end

	test "is_eater_cook" do 
		assert @eater[:cooking]
	end
end