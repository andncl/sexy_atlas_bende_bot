class TelegramWebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext
  include ApplicationHelper

  def start!(*)
    response = from ? "Hello #{from['last_name']}!" : 'Hi there!'
    respond_with :message, text: response
  end

  def help!(*)
    respond_with :message, text: t('.content')
  end

  def memo!(*args)
    if args.any?
      session[:memo] = args.join(' ')
      respond_with :message, text: t('.notice')
    else
      respond_with :message, text: t('.prompt')
      save_context :memo!
    end
  end

  def test_things!(*)
    respond_with :message, text:  t('.content')
  end

  def remind_me!(*)
    to_remind = session.delete(:memo)
    reply = to_remind || t('.nothing')
    respond_with :message, text: reply
  end

  def keyboard!(value = nil, *)
    if value
      respond_with :message, text: t('.selected', value: value)
    else
      save_context :keyboard!
      respond_with :message, text: t('.prompt'), reply_markup: {
        keyboard: [t('.buttons')],
        resize_keyboard: true,
        one_time_keyboard: true,
        selective: true,
      }
    end
  end

  def inline_keyboard!(*)
    respond_with :message, text: t('.prompt'), reply_markup: {
      inline_keyboard: [
        [
          {text: t('.alert'), callback_data: 'alert'},
          {text: t('.no_alert'), callback_data: 'no_alert'},
        ],
        [{text: t('.repo'), url: 'https://github.com/telegram-bot-rb/telegram-bot'}],
      ],
    }
  end

  def callback_query(data)
    message_id = update.dig('callback_query','message', 'message_id')
    meal = Meal.find_by(message_id: message_id)
    puts meal

    case data
    when 'wants_to_eat'
      wants_to_eat(meal)
      answer_callback_query t('.joining_meal')
    when 'wants_to_pay'
      wants_to_pay(meal)
      answer_callback_query t('.paying')
    when 'wants_to_quit'
      wants_to_quit(meal)
      answer_callback_query t('.leaving')
    else
      answer_callback_query t('.no_alert')
    end
  end

  def inline_query(query, _offset)
    query = query.first(10) # it's just an example, don't use large queries.
    t_description = t('.description')
    t_content = t('.content')
    results = Array.new(5) do |i|
      {
        type: :article,
        title: "#{query}-#{i}",
        id: "#{query}-#{i}",
        description: "#{t_description} #{i}",
        input_message_content: {
          message_text: "#{t_content} #{i}",
        },
      }
    end
    answer_inline_query results
  end

  # As there is no chat id in such requests, we can not respond instantly.
  # So we just save the result_id, and it's available then with `/last_chosen_inline_result`.
  def chosen_inline_result(result_id, _query)
    session[:last_chosen_inline_result] = result_id
  end

  def last_chosen_inline_result!(*)
    result_id = session[:last_chosen_inline_result]
    if result_id
      respond_with :message, text: t('.selected', result_id: result_id)
    else
      respond_with :message, text: t('.prompt')
    end
  end

  def k!(*args)
    meal = wants_to_cook(*args)
    respond_with :message, text: t('.prompt', first_name: Current.user.first_name), reply_markup: {
      inline_keyboard: [
        [
          {text: t('.eat'), callback_data: 'wants_to_eat'},
          {text: t('.leave'), callback_data: 'wants_to_quit'},
          {text: t('.pay'), callback_data: 'wants_to_pay'}
        ],
        [{text: t('.overview'), url: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'}],
      ],
    }
    meal.update(message_id: update.dig('message', 'message_id') + 1)
  end

  def message(message)
    check_user()
    message_processor(message)
    respond_with :message, text: t('.content', name: from['first_name'],text: message['text'])
  end

  def action_missing(action, *_args)
    if action_type == :command
      respond_with :message,
        text: t(
          'telegram_webhooks.action_missing.command',
         command: action_options[:command]
         )
    end
  end
end
