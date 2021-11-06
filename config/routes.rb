Rails.application.routes.draw do
  root :to => "homes#top"
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :articles do
    resource :favorites, only: [:create, :destroy]
    resources :goods, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resource :genres
  resources :users, only: [:show, :edit]
  resources :shops, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
