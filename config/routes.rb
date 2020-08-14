Rails.application.routes.draw do
  root 'items#index'
  get 'items/edit', :to => "items#edit"
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  
  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  resources :cards, only: [:index, :new, :create, :destroy]
  resources :products do
    resources :contracts, only: [:new, :create]
  end
  get 'products/new/mid_category', to: 'products#mid_category'
  get 'products/new/small_category', to: 'products#small_category'

  
end
