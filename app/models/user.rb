class User < ApplicationRecord
	has_many :meals
	has_many :eaters, through: :meals

  def init
  	self.cooking ||= falses           #will set the default value only if it's nil
  end

	def is_eater(meal)
		Eater.exists?(meal: meal, user: self)
	end

	def is_eating(meal)
		Eater.find_by(meal: meal, user: self).eating
	end

	def is_cooking(meal)
		Eater.find_by(meal: meal, user: self).eating
	end
end
