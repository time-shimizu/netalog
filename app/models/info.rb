class Info < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  def action_user
    User.find(self.action_user_id)
  end
end
