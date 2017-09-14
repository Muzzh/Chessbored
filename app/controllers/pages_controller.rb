class PagesController < ApplicationController

  def index
    @all_games = Game.all
  end
end
