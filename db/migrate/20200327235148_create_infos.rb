class CreateInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :infos do |t|
      t.integer :micropost_id
      t.integer :action_user_id
      t.references :user, foreign_key: true

      t.timestamps
    end
      add_index :infos, [:user_id, :created_at]
  end
end
