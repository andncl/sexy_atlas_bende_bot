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

		meal = Meal.create(name: args.join(' '), cook_id: Current.user.id)
		eater = Eater.create(
			first_name: Current.user.first_name,
			user_id: Current.user.id,
			meal_id: meal[:id],
			cooking: true,
			eating: true
			)
	end

	def wants_to_eat(meal)
		check_user()
		puts meal.inspect

		eater = Eater.create(
			first_name: Current.user.first_name,
			user_id: Current.user.id,
			meal_id: meal[:id],
			cooking: false,
			eating: true
			)
		puts eater.inspect 
		puts 'WANTS TO EAT!'
	end

	def wants_to_quit(meal)
		check_user()
		puts 'WANTS TO QUIT!'
		eater = Eater.find_by(meal_id: meal[:id])
		eater.update(eating: false)
		puts eater.inspect

	end

	def wants_to_pay(meal)
		check_user()
		puts 'WANTS TO CLOSE!'
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
