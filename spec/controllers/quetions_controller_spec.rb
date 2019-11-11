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
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new quetion in the database' do       
        expect { post :create, params: {quetion: attributes_for(:quetion)}}.to change(Quetion,:count).by(1)
      end
      it 'redirect to show view' do
        post :create, params: {quetion: attributes_for(:quetion)}
        expect(response).to redirect_to(assigns(:quetion))
      end
    end
    context 'with invalid attributes' do
      it 'does not save the quetion' do
        expect { post :create, params: {quetion: attributes_for(:invalid_quetion)}}.to_not change(Quetion,:count)
      end
      it 're-renders new view' do
        post :create, params: {quetion: attributes_for(:invalid_quetion)}
        expect(response).to render_template :new
      end
    end
  end
  describe "PATCH #update" do
    let(:quetion) {create(:quetion)}
    context "with valid attributes" do
      it 'assigns the requested quetion to @quetion' do      
        patch :update, params: {id: quetion, quetion: attributes_for(:quetion)}
        expect(assigns(:quetion)).to eq quetion
      end
      it 'changes quetion attributes' do
        patch :update, params: {id: quetion, quetion: {title: 'newTitle', body: 'newBody'}}
        quetion.reload
        expect(quetion.title).to eq 'newTitle'
        expect(quetion.body).to eq 'newBody'
      end
      it 'redirect to the updated quetion' do
        patch :update, params: {id: quetion, quetion: attributes_for(:quetion)}
        expect(response).to redirect_to quetion
      end
    end
    context "with invalid attributes" do
    end
  end
end
