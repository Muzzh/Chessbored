require 'rails_helper'

RSpec.describe ChessPiecesController, type: :controller do
  
  describe 'chess_pieces#create' do

    it "should allow creating a King" do
      post :create, params: { chess_piece: { user_id: 1, game_id: 1, x: 1, y: 2, captured: false, type: 'King' } }
      expect(King.last.user_id).to eq(1)
      expect(King.last.x).to eq(1)
      expect(King.last.y).to eq(2)
      expect(King.last.captured).to eq(false)
      expect(ChessPiece.last.type).to eq('King')
    end

    it "should check for a valid move for a King" do
      x= 0; y=0; type="King"
      post :create, params: { chess_piece: { user_id: 1, game_id: 1, x: x, y: y, captured: false, type: type } }
      piece = King.last
      expect(piece.valid_move?(0,1)).to eq(true)
      expect(piece.valid_move?(1,0)).to eq(true)
      expect(piece.valid_move?(0,0)).to eq(false)
      expect(piece.valid_move?(1,1)).to eq(false)
      expect(piece.valid_move?(2,2)).to eq(false)
      expect(piece.valid_move?(-1,0)).to eq(false)
      piece.x = 0; piece.y = 7
      expect(piece.valid_move?(0,8)).to eq(false)
    end

    it "should check for a valid move for a Bishop" do
      x= 2; y=0; type="Bishop"
      post :create, params: { chess_piece: { user_id: 1, game_id: 1, x: x, y: y, captured: false, type: type } }
      piece = Bishop.last
      expect(piece.valid_move?(4,2)).to eq(true)
      expect(piece.valid_move?(1,1)).to eq(true)
      expect(piece.valid_move?(2,0)).to eq(false)
      expect(piece.valid_move?(3,2)).to eq(false)
      expect(piece.valid_move?(-1,0)).to eq(false)
    end

    it "should check for a valid move for a Knight" do
      x= 2; y=5; type="Knight"
      post :create, params: { chess_piece: { user_id: 1, game_id: 1, x: x, y: y, captured: false, type: type } }
      piece = Knight.last
      expect(piece.valid_move?(3,7)).to eq(true)
      expect(piece.valid_move?(4,6)).to eq(true)
      expect(piece.valid_move?(4,4)).to eq(true)
      expect(piece.valid_move?(3,3)).to eq(true)
      expect(piece.valid_move?(1,3)).to eq(true)
      expect(piece.valid_move?(0,4)).to eq(true)
      expect(piece.valid_move?(0,6)).to eq(true)
      expect(piece.valid_move?(1,8)).to eq(false)
      expect(piece.valid_move?(2,6)).to eq(false)
      expect(piece.valid_move?(3,4)).to eq(false)
    end

    it "should check for a valid move for a Rook" do
      x= 0; y=0; type="Rook"
      post :create, params: { chess_piece: { user_id: 1, game_id: 1, x: x, y: y, captured: false, type: type } }
      piece = Rook.last
      expect(piece.valid_move?(0,4)).to eq(true)
      expect(piece.valid_move?(3,0)).to eq(true)
      expect(piece.valid_move?(4,5)).to eq(false)
      expect(piece.valid_move?(8,0)).to eq(false)
      expect(piece.valid_move?(0,-1)).to eq(false)
    end

   it "should check for a valid move for a Queen" do
      x= 3; y=3; type="Queen"
      post :create, params: { chess_piece: { user_id: 1, game_id: 1, x: x, y: y, captured: false, type: type } }
      piece = Queen.last
      expect(piece.valid_move?(3,5)).to eq(true)  # up 2 steps
      expect(piece.valid_move?(3,2)).to eq(true)  # down 1 step
      expect(piece.valid_move?(1,3)).to eq(true)  # left 2 steps
      expect(piece.valid_move?(4,3)).to eq(true)  # right 2 steps
      expect(piece.valid_move?(1,5)).to eq(true)  # north west 2 steps
      expect(piece.valid_move?(4,4)).to eq(true)  # north east 1 step
      expect(piece.valid_move?(5,1)).to eq(true)  # south east 2 steps
      expect(piece.valid_move?(2,2)).to eq(true)  # south west 1 steps
      expect(piece.valid_move?(4,5)).to eq(false) 
      expect(piece.valid_move?(6,7)).to eq(false)
      expect(piece.valid_move?(8,0)).to eq(false)
      expect(piece.valid_move?(0,-1)).to eq(false)
    end

    # Note: need color column in move table
    # it "should check for a valid move for a Pawn" do
    #   x= 1; y=0; type="Pawn"
    #   post :create, params: { chess_piece: { user_id: 1, game_id: 1, x: x, y: y, captured: false, type: type } }
    #   piece = Pawn.last
    #   expect(piece.valid_move?(0,0)).to eq(true)    # left
    #   expect(piece.valid_move?(0,2)).to eq(true)    # right
    #   expect(piece.valid_move?(1,1)).to eq(true)    # up 1 step
    #   expect(piece.valid_move?(1,2)).to eq(false)   # up 2 steps
    #   expect(piece.valid_move?(-1,0)).to eq(false)
    #   expect(piece.valid_move?(8,0)).to eq(false)
    #   piece.x = 1; piece.y = 7
    #   expect(piece.valid_move?(1,8)).to eq(true) # pass the board
    #   expect(piece.valid_move?(1,9)).to eq(false) # not in board
    #   expect(piece.valid_move?(1,6)).to eq(false) # go back
    # end

  end

end