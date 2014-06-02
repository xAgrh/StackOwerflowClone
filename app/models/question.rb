class Question < ActiveRecord::Base
  
  belongs_to :user
  has_many   :answers, dependent: :destroy
  has_many   :attachments, as: :attachmentable, dependent: :destroy
  has_many   :comments,    as: :commentable,    dependent: :destroy
  has_many   :question_tags
  has_many   :tags, through: :question_tags
  
  validates :title, :body, presence: true 
  validates :user_id,      presence: true
  
  accepts_nested_attributes_for :attachments, allow_destroy: true
  accepts_nested_attributes_for :tags, allow_destroy: true
  
  def tag_names
    tags.pluck(:name)
  end
  
  def tag_names=(names)
    self.tags = names.split(",").map { |name| Tag.where(name: name).first_or_create! }
  end
  
end
