FactoryGirl.define do
  factory :user do |f|
    f.sequence(:username) { |n| "Bananas#{n}" }
    f.sequence(:email) { |n| "Ipee#{n}@yellowsnow.com" }
    f.password "robot"
    f.password_confirmation { |u| u.password }
  end

  factory :invalid_user, parent: :user do |f|
    f.username nil
  end
end