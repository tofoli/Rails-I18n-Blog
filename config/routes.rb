Rails.application.routes.draw do

  get "welcome/index", as: "welcome"
  root to: 'welcome#index'

  devise_for :users

  namespace :admin do
    resources :users
    resources :posts
  end

end
