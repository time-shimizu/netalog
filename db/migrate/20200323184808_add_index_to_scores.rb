class AddIndexToScores < ActiveRecord::Migration[5.2]
  def change
    add_index :scores, [:user_id, :micropost_id], unique: true
  end
end
