class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  
  has_many   :attachments, as: :attachmentable
  
  validates :body,    presence: true
  validates :user_id, presence: true
  
  accepts_nested_attributes_for :attachments
  
end
