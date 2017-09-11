Rails.application.routes.draw do
  root 'pages#index'
  resources :chess_pieces, only: :create
  resources :games, only: [:new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
