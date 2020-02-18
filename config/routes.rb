Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root :to => "tractors#index"
  end

  root :to => redirect("/users/sign_in")
  resources :tractors, only: %i[show new create] do
    resources :bookings, only: [ :new, :create ]
  end
  resources :bookings, only: :show
end
