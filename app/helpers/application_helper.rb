module ApplicationHelper
	def message_processor(full_message)
		puts full_message.to_s
	end

	def check_user()
	  if User.exists?(id: from['id'] )
	    Current.user = 	User.find(from['id'])
	    puts "HALLLOOOOOOOOOOOOOO"
	    puts Current.user.inspect
	  else
	    Current.user = User.create(
	    	id: from['id'],
	      first_name: from['first_name'],
	      last_name: from['last_name'],
	      balance: 0.0,
	      )
	  end
	end

	def wants_to_cook(*args)
		check_user()
		puts "HALLLOOOOOOOOOOOOOO"
		puts Current.user.inspect

		cook = Cook.new()
		meal = Meal.create(
				name: args.join(' '), 
				cook_id: Current.user.id
			)
	end

	def wants_to_eat
	end

	def wants_to_quit
	end

	def wants_to_close
	end

	def wants_to_price
	end
end
