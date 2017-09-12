Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :articles
    resources :admin_users
    resources :editor_users

    root to: "users#index"
  end

  resources :articles
  devise_for :users
  get 'static/index'

  root to: "static#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
