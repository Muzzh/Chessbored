class ChessPiecesController < ApplicationController

  def create
    ChessPiece.create(chess_piece_params)
  end

  def show
    render_target = 'games/' + game.id + '/show'
    render render_target
  end

  def update
    
  end

  private

  def chess_piece_params
    params.require(:chess_piece).permit(:type, :user_id, :game_id, :x, :y, :captured)
  end
end
