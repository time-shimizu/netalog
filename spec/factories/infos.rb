FactoryBot.define do
  factory :info do
    micropost_id 1
    action_user_id 1
    association :user
  end
end
