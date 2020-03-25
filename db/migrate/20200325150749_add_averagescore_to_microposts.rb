class AddAveragescoreToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :averagescore, :integer
  end
end
