require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let!(:quetion) {create :quetion}
  describe 'POST #create' do    
    context 'with valid attributes' do
      it 'saves the new answer in the database' do       
        expect { post :create, params: {answer: attributes_for(:answer), quetion_id: quetion}}.to change(quetion.answers,:count).by(1)
      end
      it 'redirect to quetion show view' do
        post :create, params: {answer: attributes_for(:answer), quetion_id: quetion}
        expect(response).to redirect_to(assigns(:quetion))
      end
    end
    context 'with invalid attributes' do
      it 'does not save the answer' do
        expect { post :create, params: {answer: attributes_for(:invalid_answer), quetion_id: quetion}}.to_not change(Answer,:count)
      end
      it 'redirect to quetion show view' do
        post :create, params: {answer: attributes_for(:invalid_answer), quetion_id: quetion}
        expect(response).to redirect_to(assigns(:quetion))
      end
    end
  end

  describe 'PATCH #update' do
    let(:answer){create(:answer, quetion: quetion)}

    it 'assigns the requested answer to @answer' do      
      patch :update, params: {id: answer, quetion_id: quetion, answer: attributes_for(:answer)},format: :js
      expect(assigns(:answer)).to eq answer
    end

    it 'assigns to quetion' do
      patch :update, params: {id: answer, quetion_id: quetion, answer: attributes_for(:answer)},format: :js
      expect(assigns(:quetion)).to eq quetion
    end

    it 'changes answer attributes' do
      patch :update, format: :js, params: {id: answer, quetion_id: quetion, answer: {body: 'new body' }}
      answer.body ='new body' # patch
      quetion.reload
      expect(answer.body).to eq 'new body'
    end
    # it 'render update template' do
    #   patch :update, params: {id: answer, quetion_id: quetion, answer: attributes_for(:answer)},format: :js
    #   expect(response).to render_template :update
    # end
  end
end
