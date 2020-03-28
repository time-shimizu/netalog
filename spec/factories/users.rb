FactoryBot.define do
  factory :user do
    name "sample"
    sequence(:email) {|n| "sample#{n}@example.com"}
    password "foobar"
    profile "sample profile"
  end
end
