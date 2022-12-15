Rails.application.routes.draw do
  resources :eaters
  resources :cooks
  resources :meals
  resources :members
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  telegram_webhook TelegramWebhooksController
end
