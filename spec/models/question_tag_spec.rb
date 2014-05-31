require 'spec_helper'

describe QuestionTag do
  it { should belong_to :question }
  it { should belong_to :tag }
end
