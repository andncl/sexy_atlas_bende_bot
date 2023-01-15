module ApplicationHelper
	include Telegram::Bot::UpdatesController::ReplyHelpers

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
			answer_callback_query t('.meal.already_eater')
		else 
			eater = Eater.create(
				first_name: Current.user.first_name,
				user_id: Current.user.id,
				meal_id: meal[:id],
				cooking: false,
				eating: true
				)
			puts eater.inspect 
			puts 'WANTS TO EAT!'

			#edit_message_text(message_id: meal.message_id, text: meal.generate_meal_overview)
		end

	end

	def wants_to_quit(meal)
		check_user()
		if Current.user.is_eater(meal)
			eater = Eater.find_by(meal_id: meal[:id])
			eater.update(eating: false)
			edit_message(:text, 
				text: meal.generate_meal_overview,  
				message_id: meal[:message_id],
				parse_mode: 'MarkdownV2',
			 	reply_markup: {
		      inline_keyboard: [
		        [
		          {text: t('.eat'), callback_data: 'wants_to_eat'},
		          {text: t('.leave'), callback_data: 'wants_to_quit'},
		          {text: t('.pay'), callback_data: 'wants_to_pay'}
		        ],
		        [{text: t('.overview'), url: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'}],
		      ],
		    }
		   )
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
