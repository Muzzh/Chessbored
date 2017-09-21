class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    @all_games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
  end

  def update
    @game = Game.find_by_id(params[:id])
    white_player = @game.white_player_id
    if current_user.id != white_player
      @game.update_attributes(:black_player_id => current_user.id, :status => "in_progress")
      flash[:notice] = "Joined game!"
      redirect_to game_path(@game.id)
    else
      redirect_to games_path

    end
  end

  def show
  end

  private

  def game_params
    params.require(:game).permit(:black_player_id, :white_player_id, :status, :winner_id)
  end
end
