class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :games
  has_many :chess_pieces
  has_many :wins
  has_many :losses
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
