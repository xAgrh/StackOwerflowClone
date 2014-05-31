class Tag < ActiveRecord::Base
  validates :name, presence: true
  
  has_many :question_tags
  has_many :questions, through: :question_tags
  
end
