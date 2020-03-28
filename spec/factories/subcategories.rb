FactoryBot.define do
  factory :subcategory do
    name "MyString"
    association :category
  end
end
