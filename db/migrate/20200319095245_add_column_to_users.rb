class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :uid, :string
    add_column :users, :provider, :string
    add_column :users, :image, :string
    add_column :users, :profile, :text
  end
end
