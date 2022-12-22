class Meal < ApplicationRecord
	has_one :cook
	has_many :eaters

	  def init
      self.price ||= 0.0           #will set the default value only if it's nil
    end
end
