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

  def show
  end

  private

  def game_params
    params.require(:game).permit(:black_player_id, :white_player_id, :status, :winner_id)
  end
end
