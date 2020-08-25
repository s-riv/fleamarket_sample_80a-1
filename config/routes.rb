Rails.application.routes.draw do
  root 'toppage#index'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  
  devise_scope :user do
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get "edit_address", to: 'users/registrations#edit_address'
    post 'edit_address', to: "users/registrations#update_address"
  end

  resources :users do
    member do
      get :buy
      get :exhibition
      get :bought
    end
  end

  resources :cards, only: [:index, :new, :create, :destroy] 
  resources :products do
    resources :contracts, only: [:new, :create, :show]
  end

  get 'products/new/mid_category', to: 'products#mid_category'
  get 'products/new/small_category', to: 'products#small_category'

end
