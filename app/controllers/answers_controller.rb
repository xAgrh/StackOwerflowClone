class AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]  
  
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)  
    @answer.user = current_user
    if @answer.save
      flash[:notice] = 'Вы успешно создали ответ.'
    else
      flash[:alert] = 'Ошибка при сохранении ответа'
    end
  end
  
  def update
    @answer = Answer.find(params[:id])
    @answer.update(answer_params)
    @question = @answer.question
  end
  
  def edit
    @answer = Answer.find(params[:id])
    @question = @answer.question
  end
  
  def index
    @question = Question.find(params[:question_id])
  end
  
  def destroy
    @answer = Answer.find(params[:id])
    @question = @answer.question
    @answer.destroy
    flash[:notice] = 'Вы успешно удалили вопрос.'
    redirect_to question_path(@question)
  end
  
  private 
  
  def answer_params
    params.require(:answer).permit(:body, attachments_attributes: [:file])
  end
  
end
