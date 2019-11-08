require 'rails_helper'

RSpec.describe QuetionsController, type: :controller do
  describe "GET #index" do
    let(:quetions){create_list(:quetion, 2)}
    before do
      get :index
    end
    it 'populates an array of all quetions' do      
      expect(assigns(:quetions)).to match_array(quetions)
    end
    it 'renders index view' do
      expect(response).to render_template :index
    end
  end
end
