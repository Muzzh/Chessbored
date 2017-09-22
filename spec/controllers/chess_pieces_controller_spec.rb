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
			x = 0; y = 0; type = "King"; color = "white";
			post :create, params: { chess_piece: { user_id: 1, game_id: 1, x: x, y: y, captured: false, type: type, color: color } }
			piece = King.last
			piece.x = 4; piece.y = 4;
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
			x = 0; y = 0; type = "Bishop"; color = "white";
			post :create, params: { chess_piece: { user_id: 1, game_id: 1, x: x, y: y, captured: false, type: type, color: color } }
			piece = Bishop.last
			piece.x = 3; piece.y = 3;
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
			x = 0; y = 0; type = "Rook"; color = "white";
			post :create, params: { chess_piece: { user_id: 1, game_id: 1, x: x, y: y, captured: false, type:  type, color: color } }
			piece = Rook.last
			piece.x = 3; piece.y = 3;
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
			x = 0; y = 0; type = "Queen"; color = "white";
			post :create, params: { chess_piece: { user_id: 1, game_id: 1, x: x, y: y, captured: false, type:  type, color: color } }
			piece = Queen.last
			piece.x = 3; piece.y = 3;
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
			x = 0; y = 0; type = "Knight"; color = "white";
			post :create, params: { chess_piece: { user_id: 1, game_id: 1, x: x, y: y, captured: false, type:  type, color: color } }
			piece = Knight.last
			piece.x = 2; piece.y = 5;
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
			x = 1; y = 1; type = "Pawn";  color = "white";
			post :create, params: { chess_piece: { user_id: 1, game_id: 1, x: x, y: y, captured: false, type:  type, color: color } }
			piece = Pawn.last

			# white pawn at 2,1
			piece.color = "white" 
			piece.x = 2; piece.y = 1;
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
			piece.color = "white" 
			piece.x = 1; piece.y = 7;
			expect(piece.valid_move?(piece.x+0, piece.y+1)).to eq(true)   # pass the board
			expect(piece.valid_move?(piece.x+0, piece.y+2)).to eq(false)  

			# black pawn at 1,6
			piece.color = "black" 
			piece.x = 1; piece.y = 6;
			# valid moves
			expect(piece.valid_move?(piece.x+0, piece.y-1)).to eq(true) 	# down 1 step
			expect(piece.valid_move?(piece.x+0, piece.y-2)).to eq(true)		# down 2 steps
			expect(piece.valid_move?(piece.x+1, piece.y+0)).to eq(true)
			expect(piece.valid_move?(piece.x-1, piece.y+0)).to eq(true)
			# invalid move
			expect(piece.valid_move?(piece.x+0, piece.y+11)).to eq(false)	# invalid move - back 1 step

			# black pawn at 1,0
			piece.color = "black" 
			piece.x = 1; piece.y = 0;
			expect(piece.valid_move?(piece.x+0, piece.y-1)).to eq(true)		# pass the board
			expect(piece.valid_move?(piece.x+0, piece.y-2)).to eq(false)	# invalid move
		end

	end

end