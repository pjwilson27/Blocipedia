Rails.application.routes.draw do
  
  resources :wikis
  
  resources :charges, only: [:new, :create]
  
  get 'home/index'

  devise_for :users
  
  root to: 'home#index'

end
