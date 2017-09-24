require 'rails_helper'

RSpec.describe ChessPiecesController, type: :controller do
	
	describe 'chess_pieces#create' do

    it "should create dummy King" do
      user = FactoryGirl.create(:user)
      king = FactoryGirl.create(:king, user_id: user.id)
      expect(king.user_id).to eq(user.id)
      expect(king.x).to eq(3)
      expect(king.y).to eq(0)
      expect(king.captured).to eq(false)
      expect(king.type).to eq('King')
    end

		it "should check for a valid move for a King" do
      user = FactoryGirl.create(:user)
      piece = FactoryGirl.create(:king, user_id: user.id)
			piece.x = 4; piece.y = 4; piece.color = "white"
			# valid move
			expect(piece.valid_move?(piece.x+1, piece.y+0)).to eq(true) 
			expect(piece.valid_move?(piece.x-1, piece.y+0)).to eq(true)
			expect(piece.valid_move?(piece.x+0, piece.y+1)).to eq(true)
			expect(piece.valid_move?(piece.x+0, piece.y-1)).to eq(true)
			# invalid moves
			expect(piece.valid_move?(piece.x+0, piece.y+0)).to eq(false)
			expect(piece.valid_move?(piece.x+2, piece.y+0)).to eq(false)
			expect(piece.valid_move?(piece.x-3, piece.y+0)).to eq(false)
			expect(piece.valid_move?(piece.x+0, piece.y+2)).to eq(false)
			expect(piece.valid_move?(piece.x+0, piece.y-3)).to eq(false)
			expect(piece.valid_move?(piece.x+2, piece.y-3)).to eq(false)
		end

		it "should check for a valid move for a Bishop" do
      user = FactoryGirl.create(:user)
      piece = FactoryGirl.create(:bishop, user_id: user.id)
			piece.x = 3; piece.y = 3; piece.color = "white";
			# valid move
			expect(piece.valid_move?(piece.x+3, piece.y+3)).to eq(true)		# 3 step move
			expect(piece.valid_move?(piece.x+3, piece.y-3)).to eq(true)
			expect(piece.valid_move?(piece.x-3, piece.y+3)).to eq(true)
			expect(piece.valid_move?(piece.x-3, piece.y-3)).to eq(true)
			expect(piece.valid_move?(piece.x+3, piece.y+3)).to eq(true)
			expect(piece.valid_move?(piece.x+1, piece.y-1)).to eq(true)		# 1 step move
			# invalid moves
			expect(piece.valid_move?(piece.x+0, piece.y+0)).to eq(false)
			expect(piece.valid_move?(piece.x+2, piece.y+0)).to eq(false)
			expect(piece.valid_move?(piece.x+3, piece.y-2)).to eq(false)
			expect(piece.valid_move?(piece.x+3, piece.y+2)).to eq(false)
			expect(piece.valid_move?(piece.x+8, piece.y+8)).to eq(false)
		end

		it "should check for a valid move for a Rook" do
      user = FactoryGirl.create(:user)
      piece = FactoryGirl.create(:rook, user_id: user.id)
			piece.x = 3; piece.y = 3; piece.color = "white";
			# valid move
			expect(piece.valid_move?(piece.x+0, piece.y+2)).to eq(true)
			expect(piece.valid_move?(piece.x+0, piece.y-2)).to eq(true)
			expect(piece.valid_move?(piece.x+3, piece.y+0)).to eq(true)
			expect(piece.valid_move?(piece.x-3, piece.y+0)).to eq(true)
			expect(piece.valid_move?(piece.x+1, piece.y+0)).to eq(true)
			expect(piece.valid_move?(piece.x+0, piece.y-1)).to eq(true)
			# invalid moves
			expect(piece.valid_move?(piece.x+0, piece.y+0)).to eq(false)
			expect(piece.valid_move?(piece.x+2, piece.y+3)).to eq(false)
			expect(piece.valid_move?(piece.x-3, piece.y+4)).to eq(false)
			expect(piece.valid_move?(piece.x+0, piece.y+8)).to eq(false)
			expect(piece.valid_move?(piece.x-5, piece.y+0)).to eq(false)
		end

	 it "should check for a valid move for a Queen" do
      user = FactoryGirl.create(:user)
      piece = FactoryGirl.create(:queen, user_id: user.id)
			piece.x = 3; piece.y = 3; piece.color = "white";
			# valid  moves for rook
			expect(piece.valid_move?(piece.x+0, piece.y+2)).to eq(true)
			expect(piece.valid_move?(piece.x+0, piece.y-2)).to eq(true)
			expect(piece.valid_move?(piece.x+3, piece.y+0)).to eq(true)
			expect(piece.valid_move?(piece.x-3, piece.y+0)).to eq(true)
			expect(piece.valid_move?(piece.x+1, piece.y+0)).to eq(true)
			expect(piece.valid_move?(piece.x+0, piece.y-1)).to eq(true)
			# valid moves for bishop
			expect(piece.valid_move?(piece.x+3, piece.y+3)).to eq(true)
			expect(piece.valid_move?(piece.x+3, piece.y-3)).to eq(true)
			expect(piece.valid_move?(piece.x-3, piece.y+3)).to eq(true)
			expect(piece.valid_move?(piece.x-3, piece.y-3)).to eq(true)
			expect(piece.valid_move?(piece.x+3, piece.y+3)).to eq(true)
			expect(piece.valid_move?(piece.x+1, piece.y-1)).to eq(true)
			# invalid moves
			expect(piece.valid_move?(piece.x+0, piece.y+0)).to eq(false)
			expect(piece.valid_move?(piece.x+2, piece.y+3)).to eq(false)
			expect(piece.valid_move?(piece.x+3, piece.y-2)).to eq(false)
			expect(piece.valid_move?(piece.x-3, piece.y+2)).to eq(false)
			expect(piece.valid_move?(piece.x-3, piece.y-2)).to eq(false)
			expect(piece.valid_move?(piece.x+0, piece.y+8)).to eq(false)
		end

		it "should check for a valid move for a Knight" do
      user = FactoryGirl.create(:user)
      piece = FactoryGirl.create(:knight, user_id: user.id)
			piece.x = 2; piece.y = 5; piece.color = "white";
			# valid move
			expect(piece.valid_move?(piece.x+2, piece.y+1)).to eq(true) 
			expect(piece.valid_move?(piece.x+2, piece.y-1)).to eq(true)
			expect(piece.valid_move?(piece.x-2, piece.y+1)).to eq(true) 
			expect(piece.valid_move?(piece.x-2, piece.y-1)).to eq(true)
			expect(piece.valid_move?(piece.x+1, piece.y+2)).to eq(true)
			expect(piece.valid_move?(piece.x+1, piece.y-2)).to eq(true)
			expect(piece.valid_move?(piece.x-1, piece.y+2)).to eq(true)
			expect(piece.valid_move?(piece.x-1, piece.y-2)).to eq(true)
			# invalid moves
			expect(piece.valid_move?(piece.x+0, piece.y+0)).to eq(false)
			expect(piece.valid_move?(piece.x-2, piece.y-2)).to eq(false)
			expect(piece.valid_move?(piece.x+1, piece.y+3)).to eq(false)
			expect(piece.valid_move?(piece.x+8, piece.y+0)).to eq(false)
		end

		it "should check for a valid move for a Pawn" do
      user = FactoryGirl.create(:user)
      piece = FactoryGirl.create(:pawn, user_id: user.id)

			# white pawn at 2,1
			piece.x = 2; piece.y = 1; piece.color = "white";
			# valid move
			expect(piece.valid_move?(piece.x+0, piece.y+1)).to eq(true) 
			expect(piece.valid_move?(piece.x+0, piece.y+2)).to eq(true)		# up 2 steps
			expect(piece.valid_move?(piece.x+1, piece.y+0)).to eq(true)
			expect(piece.valid_move?(piece.x-1, piece.y+0)).to eq(true)
			# invalid move
			expect(piece.valid_move?(piece.x+0, piece.y-1)).to eq(false)	# invalid move - back 1 step
			expect(piece.valid_move?(piece.x+0, piece.y+3)).to eq(false)	# invalid move - up 3 steps
			expect(piece.valid_move?(piece.x+2, piece.y+0)).to eq(false)
			expect(piece.valid_move?(piece.x-2, piece.y+0)).to eq(false)
			expect(piece.valid_move?(piece.x+2, piece.y+2)).to eq(false)

			# white pawn at 1,7
			piece.x = 1; piece.y = 7; piece.color = "white";
			# valid moves
			expect(piece.valid_move?(piece.x+0, piece.y+1)).to eq(true)   # pass the board
			# invalid move
			expect(piece.valid_move?(piece.x+0, piece.y+2)).to eq(false)  

			# black pawn at 1,6
			piece.x = 1; piece.y = 6; piece.color = "black";
			# valid moves
			expect(piece.valid_move?(piece.x+0, piece.y-1)).to eq(true) 	# down 1 step
			expect(piece.valid_move?(piece.x+0, piece.y-2)).to eq(true)		# down 2 steps
			expect(piece.valid_move?(piece.x+1, piece.y+0)).to eq(true)
			expect(piece.valid_move?(piece.x-1, piece.y+0)).to eq(true)
			# invalid move
			expect(piece.valid_move?(piece.x+0, piece.y+11)).to eq(false)	# invalid move - back 1 step

			# black pawn at 1,0
			piece.x = 1; piece.y = 0; piece.color = "black";
			# valid moves
			expect(piece.valid_move?(piece.x+0, piece.y-1)).to eq(true)		# pass the board
			# invalid move
			expect(piece.valid_move?(piece.x+0, piece.y-2)).to eq(false)	# invalid move
		end

	end

end