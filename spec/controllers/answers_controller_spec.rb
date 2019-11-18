require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  describe 'POST #create' do
  let(:quetion) {create :quetion}
  context 'with valid attributes' do
    it 'saves the new answer in the database' do       
      expect { post :create, params: {answer: attributes_for(:answer), quetion_id: quetion}}.to change(quetion.answers,:count).by(1)
    end
    it 'redirect to quetion show view' do
      post :create, params: {answer: attributes_for(:answer), quetion_id: quetion}
      expect(response).to redirect_to(quetion)
    end
  end
  context 'with invalid attributes' do
    it 'does not save the answer' do
      expect { post :create, params: {answer: attributes_for(:invalid_answer), quetion_id: quetion}}.to_not change(Answer,:count)
    end
    it 'redirect to quetion show view' do
      post :create, params: {answer: attributes_for(:invalid_answer), quetion_id: quetion}
      expect(response).to redirect_to(quetion)
    end
  end
  end
end
