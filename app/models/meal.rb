class Meal < ApplicationRecord
	has_one :cook
	has_many :eaters

  def init
  	self.price ||= 0.0           #will set the default value only if it's nil
  end

  def generate_meal_overview
    text = I18n.t('.models.meal.header', first_name: User.find(self.cook_id).first_name) + "\n"
    eaters = Eater.where(meal_id: self.id)
    eaters.each do |eater|
    	if eater.eating
      	text = text + eater.first_name + "\n"
      end
      puts eater
    end

    text
  end
end
