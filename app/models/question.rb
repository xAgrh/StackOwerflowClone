class Question < ActiveRecord::Base
  
  belongs_to :user
  has_many   :answers, dependent: :destroy
  has_many   :attachments, as: :attachmentable, dependent: :destroy
  has_many   :comments,    as: :commentable,    dependent: :destroy
  
  
  validates :title, :body, presence: true 
  validates :user_id,      presence: true
  
  accepts_nested_attributes_for :attachments, :allow_destroy => true
  accepts_nested_attributes_for :comments, :allow_destroy => true
end
