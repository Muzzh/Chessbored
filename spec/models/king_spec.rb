require 'rails_helper'

RSpec.describe King, type: :class do
  it_behaves_like "an STI class"

  it "should allow creating a King" do
    king = King.create (
      x: 1
      y: 2
    )
    expect(King.last.x).to eq(1)
    expect(King.last.y).to eq(2)
  end
end