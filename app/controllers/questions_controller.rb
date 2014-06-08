class QuestionsController < InheritedResources::Base
  before_action :authenticate_user!, only: [:new, :create]  
  before_action :build_answer, only: :show
  before_action :build_attachment, only: :new
  before_action :build_tag, only: :new
  
  respond_to :html
  
  
  protected
  
  def build_answer
    @comment = resource.comments.build
    resource.tags.build
  end
  
  def build_attachment
    build_resource.attachments.build
  end
 
  def build_tag
    build_resource.tags.build
  end
    
  def question_params
    params.require(:question).permit(:title, :body, :user_id, :tag_names, attachments_attributes: [:id, :file, :_destroy], comments_attributes: [:id, :body, :_destroy], tags_attributes: [:name])
  end
end
