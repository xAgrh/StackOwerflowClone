class CommentsController < InheritedResources::Base
  before_action :authenticate_user!
  
  respond_to :html, :json
  
  actions :create
  
  belongs_to :question, :answer, polymorphic:true

  
  
  def create

    @question = parent.is_a?(Question) ? parent : parent.question
    
    create! do |success, failure|
      success.json do
	if parent.is_a?(Question)
          PrivatePub.publish_to "/questions/#{@question.id}/comments", comment: resource.to_json
	else
          PrivatePub.publish_to "/questions/#{@question.id}/answers/comments", comment: resource.to_json
	end
        render nothing: true
	
      end
      failure.json do
        format.html { render text: resource.errors.full_messages.join("\n"), status: :unprocessable_entity }
        format.json { render json: resource.errors.full_messages, status: :unprocessable_entity }
      end
    end

  end
 
  protected
  
  
  
    def comment_params
      params.require(:comment).permit(:body)
    end 
   
end
