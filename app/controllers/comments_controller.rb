class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  
  def create
    @question = Question.find(params[:question_id])
    @comment = @question.comments.build(comment_params)
    
    respond_to do |format|
      if @comment.save
        format.html { render partial: 'comments/comments', layout: false }
        format.json { render json: @comment }
      else
        format.html { render text: @comment.errors.full_messages.join("\n"), status: :unprocessable_entity }
        format.json { render json: @comment.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end
 
  private
    def comment_params
      params.require(:comment).permit(:body)
    end 
   
end
