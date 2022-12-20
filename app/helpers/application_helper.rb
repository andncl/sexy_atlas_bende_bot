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
	      phone_number: 1234567,
	      balance: 0.0,
	      )
	  end
	end
end
