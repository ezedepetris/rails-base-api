Rails3BaseApi::Application.routes.draw do
  # Devise
  #
  devise_for :users, only: []
  devise_scope :user do
    post 'users/sign_in', to: 'sessions#create'
  end

  # Resources require authenticated user
  #
  namespace :user do
    resources :comments, only: [:index]
  end

  # Public resources
  #
  resources :posts, only: [:index, :show]

  root :to => 'posts#index'

  mount ApiTaster::Engine => '/api_taster' if defined? ApiTaster::Engine
end

ApiTaster::RouteCollector.collect! if defined? ApiTaster::Engine
