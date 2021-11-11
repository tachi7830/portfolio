Rails.application.routes.draw do
  root :to => "homes#top"
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :articles do
    resource :favorites, only: [:create, :destroy]
    resource :goods, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :breads, only:[:index]
  resources :users, only: [:show, :edit, :update]
  resources :shops, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
