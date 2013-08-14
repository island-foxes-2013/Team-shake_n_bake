FactoryGirl.define do
  factory :answer do |f|
    f.body "White wine goes best with chicken."
    f.user
    f.question
  end
end