Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'static#home'
  get '/rules' => 'static#rules', as: 'rules'
  namespace "admin" do
    resources :boards, only: [:new, :create, :edit, :update]
  end
  resources :boards, only: [:index, :show] do
    resources :board_threads, only: [:index, :show,] do
      resources :posts, only: [:new, :create, :update, :edit]
    end
  end
  resources :users
  get '/login' => 'sessions#new', as: 'login'
  post '/session' => 'sessions#create', as: 'session'
  get '/logout' => 'sessions#destroy', as: 'logout'


end
