Rails.application.routes.draw do
  resources :kitchens
  resources :ingredients
  resources :recipts
  telegram_webhook TelegramController, :default
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
