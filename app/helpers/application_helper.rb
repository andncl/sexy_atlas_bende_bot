module ApplicationHelper
	def message_processor(full_message)
		puts full_message.to_s
	end

	def check_user()
	  if Member.exists?(id: from['id'] )
	    user = Member.find_by(telegram_id: from['id'])
	  else
	    user = Member.create(
	    	id: from['id'],
	      first_name: from['first_name'],
	      last_name: from['last_name'],
	      balance: 0.0,
	      )
	  end
	end

	def wants_to_cook
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
