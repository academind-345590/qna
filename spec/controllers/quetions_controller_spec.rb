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
    it 'assigns new answer for quetion' do
      expect(assigns(:answer)).to be_a_new(Answer)
    end
    it 'build a new attachment for answer' do
      expect(assigns(:answer).attachments.first).to be_a_new(Attachment)
    end
    it 'render show view' do
      expect(response).to render_template :show
    end
  end

  describe "GET new" do
    sign_in_user
    before {get :new}
    it "assigns a new Quetion to @quetion" do
      expect(assigns(:quetion)).to be_a_new(Quetion)
    end
    it 'build a new attachment for question' do
      expect(assigns(:quetion).attachments.first).to be_a_new(Attachment)
    end
    it "render new view" do
      expect(response).to render_template :new
    end
  end
  describe "GET #edit" do
    sign_in_user
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
    sign_in_user
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
    sign_in_user
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
      before {patch :update, params: {id: quetion, quetion: {title: 'newTitle', body: nil}}}
      it 'does not change quetion attributes' do        
        expect(quetion.title).to eq 'MyString'
        expect(quetion.body).to eq 'MyText'
      end
      it 're-render edit vieew'do
      expect(response).to render_template :edit
      end
    end
  end
  describe 'DELETE #destroy' do
    sign_in_user
    let(:quetion) {create(:quetion)}
    it 'delete quetion' do
      quetion
      expect do
        delete :destroy, params: {id: quetion}
      end.to change(Quetion, :count).by(-1)
    end
    it 'redirect to index view' do
      delete :destroy, params: {id: quetion}
      expect(response).to redirect_to quetions_path
    end
  end
end
