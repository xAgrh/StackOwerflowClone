require 'spec_helper'

describe Question do
  it { should belong_to :user }
  
  it { should have_many :answers }
  it { should have_many :attachments }
  it { should have_many :comments }
    
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
  it { should validate_presence_of :user_id }
  
  it { should accept_nested_attributes_for :attachments }
  it { should accept_nested_attributes_for :comments }
  

end
