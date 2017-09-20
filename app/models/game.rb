class Game < ApplicationRecord
  belongs_to :user_id
  
  scope :by_status, ->(status) { where(status: status) }
  scope :pending, -> { by_status('pending') }
  scope :completed, -> { by_status('completed') }
  scope :in_progress, -> { by_status('in_progress') }
  scope :recent, -> { order('games.updated_at DESC') }

  def pending?
    status == 'pending'
  end
end
