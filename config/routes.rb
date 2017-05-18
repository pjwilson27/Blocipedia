Rails.application.routes.draw do
  devise_for :users
  
  root to: 'devise/registrations#new'

end
