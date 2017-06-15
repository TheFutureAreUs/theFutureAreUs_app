Rails.application.routes.draw do
  devise_for :users
  resources :contacts, only: [:new, :create]
  resources :categories
  resources :listings


  root 'categories#index'


  match '/about', to: 'pages#about', via: :get
  match '/privacy', to: 'pages#privacy', via: :get
  match '/terms', to: 'pages#terms', via: :get
  # match '/contact', to: 'pages#contact', via: :get
end
