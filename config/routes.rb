Rails.application.routes.draw do

  get 'users/index'

  resources :wikis do
    resources :collaborators, only: [:create, :destroy]
  end
  
  resources :charges, only: [:new, :create]
  
  get 'unsub' => 'charges#unsub'
  
  get 'home/index'

  devise_for :users
  
  root to: 'home#index'

end
