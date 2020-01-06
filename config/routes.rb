Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/auth/github/callback' => 'sessions#create', via: [:get, :post]

  root to: 'static#home'
  get '/rules' => 'static#rules', as: 'rules'
  namespace "admin" do
    resources :boards, only: [:index, :new, :create, :edit, :update]
  end
  resources :boards, only: [:index, :show]
  resources :board_threads, only: [:show, :new, :create, :delete], :path => "threads"  do
    resources :posts
  end
  resources :users, only: [:index, :create, :edit, :update, :show], param: :slug
  get '/signup' => 'users#new', as: 'signup'
  get '/login' => 'sessions#new', as: 'login'
  post '/session' => 'sessions#create', as: 'session'
  get '/logout' => 'sessions#destroy', as: 'logout'


end
