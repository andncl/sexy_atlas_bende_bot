class User < ApplicationRecord
	has_many :meals
	has_many :eaters, through: :meals

	def is_eater(meal)
		Eater.where(meal_id: meal[:id]).exists?
	end
end
