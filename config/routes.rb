Rails.application.routes.draw do
  resources :batting_innings
  resources :bowling_innings
  resources :innings
  resources :players
  resources :matches
  resources :teams
  root 'home#home'
  get 'home', to: 'home#home'
  get 'contact', to: 'home#contact'
  get 'table', to: 'teams#index'
  get 'batters', to: 'home#batters'
  get 'bowlers', to: 'home#bowlers'
  post 'request_contact', to: 'home#request_contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
