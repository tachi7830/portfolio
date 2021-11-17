Rails.application.routes.draw do
  root :to => "homes#top"
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  get 'shops/search' => 'shops#search'
  get 'contact' => 'contacts#new'
  
  resources :articles do
    resource :goods, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :breads, only:[:index]
  resources :users, only: [:show, :edit, :update]
  resources :shops, only: [:index, :show] do
    resource :favourites, only: [:create, :destroy]
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
