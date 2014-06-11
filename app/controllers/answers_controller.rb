class AnswersController < InheritedResources::Base
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]  
  
  respond_to :js
  
  belongs_to :question
  
  def create

    create!(notice: "Вы успешно создали ответ.")

    
     # if @answer.save
     #   format.html { render partial: 'questions/answers', layout: false }
     #   format.json { render json: @answer }
     # else
     #   format.html { render text: @answer.errors.full_messages.join("\n"), status: :unprocessable_entity }
     #   format.json { render json: @answer.errors.full_messages, status: :unprocessable_entity }
     # end
    
  end 
  

  protected
  
  def create_resource(object)
    object.user = current_user
    super
  end
  
  def answer_params
    params.require(:answer).permit(:body, attachments_attributes: [:id, :file, :_destroy], comments_attributes: [:id, :body, :_destroy])
  end
  
end
