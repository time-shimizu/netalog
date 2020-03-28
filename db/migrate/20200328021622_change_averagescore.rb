class ChangeAveragescore < ActiveRecord::Migration[5.2]
  def change
    change_column :microposts, :averagescore, :decimal, precision: 2, scale: 1
  end
end
