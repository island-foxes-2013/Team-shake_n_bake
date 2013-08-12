# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question_vote do |f|
    f.user_id 1
    f.votetable 1
    f.votetable 'Question'
  end

  factory :answer_vote do |f|
    f.user_id 1
    f.votetable 1
    f.votetable 'Answer'
  end
end
