class ChessPiecesController < ApplicationController

  def create
    ChessPiece.create(chess_piece_params)
  end

  def update
    piece = ChessPiece.find(params[:id])
    # check for target
    target = ChessPiece.where(game_id: piece.game_id, x: params[:x_target], y: params[:y_target]).first
    if target 
      if piece.color != target.color # target exists, check for capture
        target.update_attributes(captured: true, x: nil, y: nil) # mark target as captured
        unless piece.move_to(params[:x_target], params[:y_target])
          flash[:notice] = "Can't do that!"
        end
      end
    else
      unless piece.move_to(params[:x_target], params[:y_target])
        flash[:notice] = "Can't do that!"
      end
    end
    redirect_to piece.game
  end

  private

  def chess_piece_params
    params.require(:chess_piece).permit(:type, :user_id, :game_id, :x, :y, :captured, :color)
  end

end
