# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    question nil
    user nil
    answer nil
    content "MyString"
  end
end
