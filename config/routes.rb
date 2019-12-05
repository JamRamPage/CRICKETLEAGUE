Rails.application.routes.draw do
  resources :batting_innings
  resources :bowling_innings
  post 'innings', to: 'innings#create'
  resources :matches do
    resources :innings
    post 'matches(/:id)/innings', to: 'innings#create'
  end
  resources :teams do
    resources :players
    post 'teams(/:id)/players', to: 'players#create'
  end
  root 'home#home'
  get 'home', to: 'home#home'
  get 'contact', to: 'home#contact'
  get 'table', to: 'teams#index'
  get 'batters', to: 'home#batters'
  get 'bowlers', to: 'home#bowlers'
  get 'player', to: 'player#show'
  post 'request_contact', to: 'home#request_contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
