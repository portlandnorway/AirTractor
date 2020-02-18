Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root :to => "tractors#index"
  end

  root :to => redirect("/users/sign_in")
  resources :tractors, only: %i[show new create]
end
