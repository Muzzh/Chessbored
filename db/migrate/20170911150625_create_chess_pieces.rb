class CreateChessPieces < ActiveRecord::Migration[5.0]
  def change
    create_table :chess_pieces do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :x
      t.integer :y
      t.boolean :captured
      t.string :type
      t.timestamps
    end
  end
end
