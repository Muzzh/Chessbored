Rails.application.routes.draw do
  root 'pages#index'
  resources :chess_pieces, only: :create
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
