require 'rails_helper'

describe ProjectsController do
  describe '#index' do
    it 'should return success response' do
      sign_in create(:user)
      get :index
      expect(response).to have_http_status(:ok)
    end

    # it 'should return projects' do
    #   create_list :project, 2
    #   get :index
    #   expect(page.body).to have_content "My project"
    # end
  end
end
