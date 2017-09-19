class PagesController < ApplicationController

  def index
    @all_games = Game.all
  end

  def create
  end

end
