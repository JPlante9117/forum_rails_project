Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/auth/github/callback' => 'sessions#create', via: [:get, :post]

  root to: 'static#home'
  get '/rules' => 'static#rules', as: 'rules'
  get '/admin' => 'admin#index'
  namespace "admin" do
    resources :categories
    resources :boards
    resources :static_pages, only: [:index, :edit, :update], param: :slug
  end
  resources :boards, only: [:index, :show]
  resources :board_threads, only: [:show, :new, :create, :edit, :update, :destroy], :path => "threads"  do
    resources :posts, except: [:update]
    patch '/posts' => 'posts#update'
  end
  resources :users, param: :slug
  get '/signup' => 'users#new', as: 'signup'
  get '/login' => 'sessions#new', as: 'login'
  post '/session' => 'sessions#create', as: 'session'
  get '/logout' => 'sessions#destroy', as: 'logout'
  get '/threads/:board_thread_id/lock' => 'board_threads#lock', as: 'lock'
  post '/karma' => 'users#karma', as: 'karma'
  post '/ban' => 'users#banned', as: 'banned'
  post '/search' => 'board_threads#search'

end
