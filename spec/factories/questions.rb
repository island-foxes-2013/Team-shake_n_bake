FactoryGirl.define do
  factory :question do |f|
    f.user
    f.title "a question title here"
    f.body "lot's of stuff goes here"
  end
end