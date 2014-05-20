class QuestionsController < ApplicationController
  before_action :load_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  
  
  def index
    @questions = Question.all
  end
  
  def show
    @answer = @question.answers.build
  end
  
  def new
    @question = Question.new
    @question.attachments.build
  end
  
  def edit
  end
  
  def create
    @question = Question.new(question_params)
    @question.user = current_user
    
    if @question.save
      flash[:notice] = 'Вы успешно создали вопрос.'
      redirect_to @question
    else
      render :new
    end
  end
  
  def update
    if @question.update(question_params)
      flash[:notice] = 'Вы успешно отредактировали вопрос.'
      redirect_to @question
    else
      render :edit
    end
  end
  
  def destroy
    @question.destroy
    flash[:notice] = 'Вы успешно удалили вопрос.'
    redirect_to questions_path
  end
  
  private
  
  def question_belongs_to_current_user
    unless current_user == @question.user
      flash[:alert] = 'Это не Ваш вопрос!'
      redirect_to root_path
    end
  end
  
  def load_question
    @question = Question.find(params[:id])
  end
  
  def question_params
    params.require(:question).permit(:title, :body, attachments_attributes: [:file])
  end
end
