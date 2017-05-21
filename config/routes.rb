Rails.application.routes.draw do
  get 'wiki/index'

  get 'wiki/show'

  get 'wiki/new'

  get 'wiki/edit'

  get 'wiki/destroy'

  get 'home/index'

  devise_for :users
  
  root to: 'home#index'

end
