Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "articles#index"
  resources :articles
  get "signup", to: "users#new"
  resources :users, except: [:new]
end
