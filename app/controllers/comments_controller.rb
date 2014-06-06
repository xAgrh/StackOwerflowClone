class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  
  def create
    
    @parent = Question.find(params[:question_id]) if params[:question_id]
    @parent ||= Answer.find(params[:answer_id]) 
    @comment = @parent.comments.build(comment_params)
    @question = @parent.is_a?(Question) ? @parent : @parent.question
    
    
    respond_to do |format|
      if @comment.save
        # format.html { render partial: 'comments/show_comments', layout: false }
        # format.json { render json: @comment }
	format.json do
	  PrivatePub.publish_to "/questions/#{@question.id}/comments", comment: @comment.to_json
	  PrivatePub.publish_to "/questions/#{@question.id}/answers/comments", comment: @comment.to_json
	  render nothing: true
	end
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
