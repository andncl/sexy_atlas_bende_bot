module ApplicationHelper
	include Telegram::Bot::UpdatesController::ReplyHelpers
	include MessageHelper
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
		return meal
	end

	def wants_to_eat(meal)
		check_user()
		puts meal.inspect
		if Current.user.is_eater(meal)
			if Current.user.is_eating(meal)
				answer_callback_query t('.meal.already_eater')
			else
				Eater.find_by(user: Current.user, meal: meal).update(eating: true)
				answer_callback_query t('.meal.joining_meal')
				update_meal_summary(meal)
			end
		else 
			eater = Eater.create(
				first_name: Current.user.first_name,
				user_id: Current.user.id,
				meal_id: meal[:id],
				cooking: false,
				eating: true
			)
			update_meal_summary(meal)
		end

	end

	def wants_to_quit(meal)
		check_user()
		if Current.user.is_eater(meal)
			if Current.user.is_eating(meal)
				Eater.find_by(meal: meal, user: Current.user).update(eating: false)
				update_meal_summary(meal)
			else
				answer_callback_query t('.meal.already_quitted')
			end
		else 
			answer_callback_query t('.meal.not_yet_joined')
		end
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
