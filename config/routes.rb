Rails.application.routes.draw do
  
  resources :wikis
  
  resources :charges, only: [:new, :create]
  match 'unsub', to: "charges#unsub", via: 'delete'
  
  get 'home/index'

  devise_for :users
  
  root to: 'home#index'

end
