Rails.application.routes.draw do

  get 'users/index'

  resources :wikis
  
  resources :collaborators, only: [:create, :destroy]
  
  resources :charges, only: [:new, :create]
  
  get 'unsub' => 'charges#unsub'
  
  get 'home/index'

  devise_for :users
  
  root to: 'home#index'

end
