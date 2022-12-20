module ApplicationHelper
	def message_processor(full_message)
		puts full_message.to_s
	end

	def check_user()
	  if Member.find_by_id(from['id'].to_s).exists?
	    user = Member.find_by(telegram_id: from['id'])
	  else
	    user = Member.create(
	    	id: from['id']
	      first_name: from['first_name'],
	      last_name: from['first_name'],
	      phone_number: 1234567,
	      balance: 0.0,
	      telegram_id: from['id']
	      )
	  end
	end
end
