class User < ApplicationRecord
	has_many :meals
	has_many :eaters, through: :meals
end
