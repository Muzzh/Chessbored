class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :current_game, only: [:show, :forfeit]
  before_action :chess_pieces, only: [:show]

  def index
    @pending_games = Game.all.pending
    @random_game = Game.pending.where.not(white_player_id: current_user).order("RANDOM()").first
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

  def forfeit
    @game.forfeit(current_user.id)
    redirect_to game_path(@game), notice: "You have forfeited this game."
  end

  def forfeit_no_opponent
    @game.forfeit_no_opponent(current_user.id)
    redirect_to game_path(@game), notice: "You have forfeited this game."
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
      flash[:notice] = "Joined game #{@game.id}!"
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
    @game ||= Game.find(params[:id] || params[:game_id])
  end

  def game_params
    params.require(:game).permit(:black_player_id, :white_player_id, :status, :winner_id)
  end
end
