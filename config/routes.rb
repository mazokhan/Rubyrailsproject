Rails.application.routes.draw do
  root 'home#index'
  get 'home/current_loc'
  get 'home/search_weather'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
