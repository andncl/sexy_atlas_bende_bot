module ApplicationHelper
	def message_processor(full_message)
		puts full_message.to_s
	end

	def check_user()
		puts "CHECKING THE USER"
	  if User.exists?(id: from['id'] )
	    Current.user = 	User.find(from['id'])
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
		puts Current.user.inspect

		#cook = Cook.new()
		meal = Meal.create(
				name: args.join(' '), 
				cook_id: Current.user.id
			)
	end

	def wants_to_eat(meal)
		check_user()
		eater = Eater.new()
		puts 'WANTS TO EAT!'
	end

	def wants_to_quit(meal)
		check_user()
		puts 'WANTS TO QUIT!'
	end

	def wants_to_close(meal)
		check_user()
		puts 'WANTS TO CLOSE!'
	end

	def wants_to_price(meal)
		check_user()
		puts 'WANTS TO PRICE!'
	end
end
