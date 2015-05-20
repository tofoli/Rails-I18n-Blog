Rails.application.routes.draw do

  get "welcome/index", as: "welcome"
  root to: 'welcome#index'

  devise_for :users
  resources :users

end
