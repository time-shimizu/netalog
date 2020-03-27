class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
      t.string :content
      t.references :micropost, foreign_key: true

      t.timestamps
    end
    add_index :replies, [:micropost_id, :created_at]
  end
end
