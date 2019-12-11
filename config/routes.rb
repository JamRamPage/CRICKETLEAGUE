Rails.application.routes.draw do
  #We don't need to index the batting or bowling innings pages
  #because it's not possible to add them to a wrong innings by the program
  #design, so they can be edited/deleted from match show.html.erb
  resources :batting_innings, except: [:index]
  resources :bowling_innings, except: [:index]
  resources :matches do
    #We don't need to index or show innings since the details
    #of each innings are shown in the match show page
    resources :innings, except: [:index, :show]
  end
  resources :teams do
    #likewise, but here the details of each player are shown in
    #the team show page
    resources :players, except: [:index, :show]
  end

  root 'home#home'
  get 'home', to: 'home#home'
  get 'contact', to: 'home#contact'
  get 'table', to: 'teams#index'
  get 'batters', to: 'home#batters'
  get 'bowlers', to: 'home#bowlers'
  post 'request_contact', to: 'home#request_contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
