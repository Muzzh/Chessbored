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
end
