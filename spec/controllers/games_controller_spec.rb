require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe "games#new action" do
    it "should successfully show the new form" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

 #  describe 'games#create' do
 #    it "should require a user to be created" do
 #      user = FactoryGirl.create :user
 #    end
 # end
end
