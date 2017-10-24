class ChessPiecesController < ApplicationController
  def create
    ChessPiece.create(chess_piece_params)
  end

  def update
    piece = ChessPiece.find(params[:id])
    unless piece.move_to(params[:x_target].to_i, params[:y_target].to_i)
      flash[:notice] = "Can't do that!"
    end
    redirect_to piece.game
  end

  private

  def chess_piece_params
    params.require(:chess_piece).permit(:type, :user_id, :game_id, :x, :y, :captured, :color)
  end
end
