Rails.application.routes.draw do
  resources :gamers
 
  root 'gamers#index'
end
