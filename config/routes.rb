Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'

  resources :chess_pieces, only: [:create, :update]
  resources :games, except: [:edit, :destroy] do
    post 'forfeit'
  end

  get 'games/:id/select_piece/:chess_piece_id', to: 'games#show', as: :select_piece

  put 'chess_pieces/:id/to/:x_target/:y_target', to: 'chess_pieces#update', as: :move_to

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
