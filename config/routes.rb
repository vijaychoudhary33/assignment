Rails.application.routes.draw do
  resources :tweets
  get :dashboard, to: "dashboard#index"
  root "home#index"
  devise_for :users
  resources :usernames
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
