Rails.application.routes.draw do

  get "welcome/index", as: "welcome"
  root to: 'welcome#index'
  resources :comments, except: [:edit, :update, :index, :destroy]

  devise_for :users

  namespace :admin do
    resources :users
    resources :posts
  end

end
