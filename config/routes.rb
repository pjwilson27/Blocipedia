Rails.application.routes.draw do
  
  resources :wikis
  
  resources :charges, only: [:new, :create]
  
  get 'unsub' => 'charges#unsub'
  
  get 'home/index'

  devise_for :users
  
  root to: 'home#index'

end
