class PagesController < ApplicationController

  def index
    @pending_games = Game.by_status('pending').recent
    @completed_games = Game.by_status('completed').recent
    @in_progress_games = Game.by_status('in_progress').recent
  end
end
