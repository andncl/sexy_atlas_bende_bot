module MessageHelper
	include Telegram::Bot::UpdatesController::ReplyHelpers

	def update_meal_summary(meal)
		edit_message(:text, 
			text: meal.generate_meal_overview,  
			message_id: meal[:message_id],
			#parse_mode: 'MarkdownV2',
		 	reply_markup: {
	      inline_keyboard: [
	        [
	          {text: t('.eat'), callback_data: 'wants_to_eat'},
	          {text: t('.leave'), callback_data: 'wants_to_quit'},
	          {text: t('.pay'), callback_data: 'wants_to_pay'}
	        ],
	        [{text: t('.overview'), url: 'https://www.youtube.com/watch?v=ZIN4K3ruUxU'}],
	      ],
	    }
	  )
	end
end