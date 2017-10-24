class ChessPiecesController < ApplicationController
  def create
    ChessPiece.create(chess_piece_params)
  end

  private

  def chess_piece_params
    params.require(:chess_piece).permit(:type, :user_id, :game_id, :x, :y, :captured, :color)
  end
end
