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
  describe "GET new" do
    before {get :new}
    it "assigns a new Quetion to @quetion" do
      expect(assigns(:quetion)).to be_a_new(Quetion)
    end
    it "render new view" do
      expect(response).to render_template :new
    end
  end
  describe "GET #edit" do
  let(:quetion) {create(:quetion)}
  before {get :edit, params: {id: quetion}}
  it 'assigns the requested quetion to @quetion' do      
    expect(assigns(:quetion)).to eq quetion
  end
  it 'render edit view' do
    expect(response).to render_template :edit
  end
  end
end
