require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'pages#index action' do
    it 'should successfully load the index page' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
