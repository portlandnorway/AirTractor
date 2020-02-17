Rails.application.routes.draw do
  devise_for :users
  root to: 'tractors#index'

  resources :tractors, only: %i[show new create] do

end
