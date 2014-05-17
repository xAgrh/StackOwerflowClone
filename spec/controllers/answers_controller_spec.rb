require 'spec_helper'

describe AnswersController do
  let!(:question) { create :question }
   
  describe 'POST #create' do
    context 'with valid attributes' do
      login_user
      
      it 'saves the new answer in database' do
        expect { post :create, answer: attributes_for(:answer), question_id: question, format: :js }.to change(question.answers, :count).by(1)
      end
      it 'render create template' do
        post :create, answer: attributes_for(:answer), question_id: question, format: :js
	expect(response).to render_template :create
      end
      
      it 'assigns current user to answer' do
        post :create, answer: attributes_for(:answer), question_id: question, format: :js
	expect(assigns(:answer).user).to eq @user
      end
      
    end
    
    context 'with invalid attributes' do
      it 'does not save the answer' do
        expect { post :create, answer: attributes_for(:invalid_answer), question_id: question, format: :js }.to_not change(Answer, :count)
      end
      it 'render create template' do
        post :create, answer: attributes_for(:invalid_answer), question_id: question, format: :js
	expect(response).to render_template :create
      end
    end
  end

  describe 'PATCH #update' do
    let(:answer) { create(:answer, question:question) }
    
    it 'assigns the requested answer to @answer' do
      patch :update, id: answer, question_id: question, answer: attributes_for(:answer), format: :js
      expect(assigns(:answer)).to eq answer
    end  
    
    it 'assigns the question' do
      patch :update, id: answer, question_id: question, answer: attributes_for(:answer), format: :js
      expect(assigns(:question)).to eq question
    end
    
    it 'changes answer attributes' do
      patch :update, id: answer, question_id: question, answer: {body: 'new body'}, format: :js
      answer.reload
      expect(answer.body).to eq 'new body'
    end
    it 'render update template' do
      patch :update, id: answer, question_id: question, answer: attributes_for(:answer), format: :js
      expect(response).to render_template :update
    end
    
    
  end
  
  
  
end
