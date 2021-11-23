Rails.application.routes.draw do

  root :to => "homes#top"

  devise_for :users,  controllers: {
    registrations: 'users/registrations'
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'shops/search' => 'shops#search'

  resources :articles do
    resource :goods, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]
  get "mail_check", to: "users#mail_check"

  resources :shops, only: [:index, :show] do
    resource :favourites, only: [:create, :destroy]
    resources :breads, only: [:index]
  end

  resources :contacts, only: [:new, :create]
  get "contacts/thanks", to: "contacts#thanks"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
