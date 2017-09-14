class Game < ApplicationRecord
  scope :by_status, -> status { where(status: status) }
  scope :recent, -> { order("games.updated_at DESC") }
end
