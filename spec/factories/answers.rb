# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    body "AnswerText"
    question ""
    user_id 1
  end
  
  factory :invalid_answer, class: "Answer" do
    body nil
  end
end
