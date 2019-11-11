require 'rails_helper'

RSpec.describe QuetionsController, type: :controller do
  describe "GET #index" do
    let(:quetions){create_list(:quetion, 2)}
    before {get :index}
    it 'populates an array of all quetions' do      
      expect(assigns(:quetions)).to match_array(quetions)
    end
    it 'renders index view' do
      expect(response).to render_template :index
    end
  end
  describe "GET #show" do
    let(:quetion) {create(:quetion)}
    before {get :show, params: {id: quetion}}
    it 'assigns the requested quetion to @quetion' do      
      expect(assigns(:quetion)).to eq quetion
    end
    it 'render show view' do
      expect(response).to render_template :show
    end
  end
end
