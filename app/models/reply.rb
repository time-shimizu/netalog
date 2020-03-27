class Reply < ApplicationRecord
  validates  :content, presence: true
  belongs_to :micropost
  belongs_to :user
end
