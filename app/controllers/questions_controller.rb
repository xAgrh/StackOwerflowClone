class QuestionsController < InheritedResources::Base
  before_action :authenticate_user!, only: [:new, :create, :update, :delete]  
  before_action :build_comment, only: :show
  before_action :build_attachment, only: :new
  before_action :build_tag, only: :new
  
  respond_to :html
  def create
    create!(notice: "Вы успешно создали вопрос.")
  end
  
  protected
  
  def create_resource(object)
    object.user = current_user
    super
  end
  
  def build_comment
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
