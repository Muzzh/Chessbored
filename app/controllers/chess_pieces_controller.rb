class ChessPiecesController < ApplicationController
  def create
    ChessPiece.create(chess_piece_params)
  end

  def update
    piece = ChessPiece.find(params[:id])
    piece.update_attributes(x: params[:x_target], y: params[:y_target])
    redirect_to piece.game
  end

  private

  def chess_piece_params
    params.require(:chess_piece).permit(:type, :user_id, :game_id, :x, :y, :captured)
  end
end
