Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resource :welcome
  
  root 'welcome#index'

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  get 'logout' => 'sessions#destroy'
  get 'login' => 'sessions#new'
  get 'signup' => 'users#new'

  get "admin" => "welcome#admin", :as => "admin"

end
