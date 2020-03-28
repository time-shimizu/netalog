FactoryBot.define do
  factory :reply do
    content "MyString"
    association :user
    association :micropost
  end
end
