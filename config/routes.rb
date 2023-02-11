Rails.application.routes.draw do
  get 'bookmarks/new'
  get 'users/new'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    # get 'settings' => 'users/sessions#settings'
  }
  devise_scope :user do
    get 'settings' => 'users/sessions#settings'
  end
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get "/settings", to: "users#settings"

  resources :interests, only: [:index]

  resources :bookmarks, only: [:create]

  resources :notifications, only: [:create, :show]

  resources :places, only: [] do
    member do
      get :directions
    end
  end
end
