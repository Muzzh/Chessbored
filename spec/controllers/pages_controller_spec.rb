require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'pages#index action' do
    it 'should successfully load the index page' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  # describe 'pages#create' do
  #   it "should require a user to be created" do
  #     user = FactoryGirl.create :user
  #   end
  #  end

end
