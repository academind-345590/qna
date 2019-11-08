require 'rails_helper'

RSpec.describe QuetionsController, type: :controller do
  describe "GET #index" do
    it 'populates an array of all quetions' do
      quetion1=FactoryBot.create(:quetion)
      quetion2=FactoryBot.create(:quetion)

      get :index

      expect(assigns(:quetions)).to match_array([quetion1, quetion2])
    end

    it 'renders index view' do
      get :index
      expect(response).to render_template :index
    end

  end
end
