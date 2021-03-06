require 'spec_helper'

describe User do
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  
  it { should have_many :questions }
  it { should have_many :answers }
  
  it { should have_one :profile }
  it { should accept_nested_attributes_for :profile }
end
