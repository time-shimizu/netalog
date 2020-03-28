FactoryBot.define do
  factory :micropost do
    title "MyString"
    content "MyText"
    url "MyString"
    association :user
  end
end
