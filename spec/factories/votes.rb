# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vote do |f|
    f.user_id 1
    f.answer_id 1
  end
end
