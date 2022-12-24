require "test_helper"

class ApplicationHelperTest < ActiveSupport::TestCase
	def setup
		Current.user = build(:user, :called_hans)
	end

	test "the_truth" do 
		assert_equal Current.user.first_name, "Hans"
	end
end