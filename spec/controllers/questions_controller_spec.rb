require 'spec_helper'

describe QuestionsController do
  let(:question) { create (:question) }  
  let(:user) { create :user }
  
  describe 'GET #index' do
    let(:questions) { create_list(:question, 2) }  
    before { get :index }

    it 'populates an array of all questions' do     
      expect(assigns(:questions)).to match_array(questions)
    end
    
    it 'renders index view' do
      expect(response).to render_template :index
    end
  end
  
  describe 'GET #show' do
    before { get :show, id: question }
    
    it 'assigns the requested question to @question' do
      expect(assigns(:question)).to eq question
    end
    
    it 'renders show view' do
      expect(response).to render_template :show
    end
  end
  
  describe 'GET #new' do
    login_user
        
    before { get :new }
    
    it 'assigns a new Question to @question' do
      expect(assigns(:question)).to be_a_new(Question)
    end
    
    it 'builds new attachment for question' do
      expect(assigns(:question).attachments.first).to be_a_new(Attachment)
    end
    
    it 'renders new view' do
      expect(response).to render_template :new
    end
  end
  
  describe 'GET #edit' do
    login_user
    before {get :edit, id: question }
    
    it 'assigns the requested question to @question' do
      expect(assigns(:question)).to eq question
    end
    
    it 'renders edit view' do
      expect(response).to render_template :edit
    end
  end
  
  describe 'POST #create' do
    
    login_user
    
    context 'with valid attributes' do
      it 'saves the new question in database' do
        expect { post :create, question: attributes_for(:question), user_id: user }.to change(Question, :count).by(1)
      end
      it 'redirects to created question' do
        post :create, question: attributes_for(:question), user_id: user
	expect(response).to redirect_to question_path(assigns(:question))
      end
      
      it 'saves new question to user.questions' do
	post :create, question: attributes_for(:question), user_id: user
        expect(assigns(:question).user).to eq @user
      end
      
      
    end
    
    context 'with invalid attributes' do
      it 'does not save the question' do
	expect { post :create, question: attributes_for(:invalid_question), user_id: user }.to_not change(Question, :count)
      end
      it 're-renders new view' do
        post :create, question: attributes_for(:invalid_question), user_id: user
	expect(response).to render_template :new
      end
    end
    
  end
  
  describe 'PATCH #update' do
    login_user
    context 'valid attributes' do
      it 'assigns the requested question to @question' do
	patch :update, id: question, question: attributes_for(:question)
        expect(assigns(:question)).to eq question
      end  
      it 'changes question attributes' do
	patch :update, id: question, question: { title: 'new title', body: 'new body' }
	question.reload
	expect(question.title).to eq 'new title'
	expect(question.body).to eq 'new body'
      end
      it 'redirect to the updated question' do
        patch :update, id: question, question: attributes_for(:question)
	expect(response).to redirect_to question
      end
    end
    
    context 'invalid attributes' do
      before { patch :update, id: question, question: { title: 'new title', body: nil } }
      
      it 'does not change question attributes' do
	question.reload
	expect(question.title).to eq 'QuestionTitle'
	expect(question.body).to eq 'QuestionText'
      end
      
      it 're-renders edit view'do
	expect(response).to render_template :edit
      end
    end
  end
     
  describe 'DELETE #destroy' do
    before { question }
    it 'deletes question' do
      expect { delete :destroy, id: question, user: @user }.to change(Question, :count).by(-1)
    end
    
    it 'redirect to index view' do
      delete :destroy, id: question 
      expect(response).to redirect_to questions_path
    end
  end
 
  
end
