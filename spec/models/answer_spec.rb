require 'spec_helper'

describe Answer do
  it { should belong_to :user }
  it { should belong_to :question }
  
  it { should have_many :attachments }
  it { should have_many :comments }

  it { should have_db_index :user_id }
  it { should have_db_index :question_id }
  
  it { should validate_presence_of :body }
  it { should validate_presence_of :user_id }
  
  it { should accept_nested_attributes_for :attachments }
  
end
