# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    nickname "MyNickname"
    website "MyWebsite"
    location "MyLocation"
    birthday "31-01-1980"
    about_me "MyString"
    avatar "Filename"
    user
  end
end
