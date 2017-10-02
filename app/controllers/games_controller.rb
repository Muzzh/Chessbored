class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :current_game, only: [:show]
  before_action :chess_pieces, only: [:show]

  def index
    @all_games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(:white_player_id => current_user.id, :status => "pending")
    if @game.valid?
      redirect_to game_path(@game)
    else
      return render text: 'invalid game', status: :forbidden
    end
  end

  def show
    if params[:chess_piece_id]
      @selected_piece = ChessPiece.find(params[:chess_piece_id])
    end
  end

  def update
    @game = Game.find_by_id(params[:id])
    white_player = @game.white_player_id
    if current_user.id != white_player
      @game.update_attributes(:black_player_id => current_user.id, :status => "in_progress")
      flash[:notice] = "Joined game!"
      redirect_to game_path(@game.id)
    else
      flash[:notice] = "You are already in this game as the white player!"
      redirect_to game_path(@game)
    end
  end

  private

  def chess_pieces
    @chess_pieces ||= current_game.chess_pieces
  end

  def current_game
    @game ||= Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:black_player_id, :white_player_id, :status, :winner_id)
  end
end
